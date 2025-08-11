#include <task_sensor_temperature.h>
#include "logger.h"

/* ---------- Constantes sensor interno STM32F1 ---------- */
#define V25           1.43f      /* Vsense @ 25°C */
#define AVG_SLOPE     0.0043f    /* 4.3 mV/°C */
#define ADC_FS        4095.0f

/* ---------- Estado del módulo ---------- */
static ADC_HandleTypeDef *s_hadc_int = NULL;   // ADC1 (sensor interno)
static ADC_HandleTypeDef *s_hadc_ext = NULL;   // ADC2 (pot externo)
static uint32_t           s_ext_chan  = ADC_CHANNEL_0;
static uint32_t           s_period_ms = 100;
static float              s_vdda      = 3.3f;

static volatile float s_t_int = 0.0f;      // °C reales
static volatile float s_t_ext = 0.0f;      // "grados" 0..100 (mapeo desde ADC)
static volatile bool  s_new_int = false;
static volatile bool  s_new_ext = false;

typedef enum { ST_IDLE, ST_START_INT, ST_WAIT_INT, ST_START_EXT, ST_WAIT_EXT } sm_t;
static volatile sm_t s_state = ST_IDLE;
static volatile uint32_t s_next_tick = 0;

/* ---------- Helper: iniciar conversión por IT ---------- */
static bool start_adc_it(ADC_HandleTypeDef *hadc, uint32_t channel, uint32_t sample_time)
{
    if (!hadc) return false;
    ADC_ChannelConfTypeDef cfg = (ADC_ChannelConfTypeDef){0};
    cfg.Channel      = channel;
    cfg.Rank         = ADC_REGULAR_RANK_1;
    cfg.SamplingTime = sample_time;

    if (HAL_ADC_ConfigChannel(hadc, &cfg) != HAL_OK) return false;
    if (HAL_ADC_Start_IT(hadc) != HAL_OK)           return false;
    return true;
}

/* ---------- API ---------- */
void sen_temp_init(ADC_HandleTypeDef *hadc_int,
                   ADC_HandleTypeDef *hadc_ext,
                   uint32_t ext_chan,
                   uint32_t period_ms,
                   float vdda)
{
    s_hadc_int  = hadc_int;
    s_hadc_ext  = hadc_ext;
    s_ext_chan  = ext_chan;
    s_period_ms = (period_ms == 0) ? 100 : period_ms;
    s_vdda      = (vdda > 0.0f) ? vdda : 3.3f;

    s_t_int = 0.0f;
    s_t_ext = 0.0f;
    s_new_int = s_new_ext = false;

    s_state = ST_IDLE;
    s_next_tick = HAL_GetTick(); // arranca ya

    /* IMPORTANTE en CubeMX:
       - ADC1: habilitar "Temperature sensor" (TSVREFE) y usar SampleTime = 239.5 cycles.
       - ADC2: pin PA0 en Analog; Regular Channel = ADC_CHANNEL_0; SampleTime ~71.5 cycles.
    */
}

void sen_temp_set_vdda(float vdda)
{
    if (vdda > 2.4f && vdda < 3.6f) s_vdda = vdda;
}

void sen_temp_update(void)
{
    uint32_t now = HAL_GetTick();

    switch (s_state)
    {
    case ST_IDLE:
        if ((int32_t)(now - s_next_tick) >= 0)
            s_state = ST_START_INT;
        break;

    case ST_START_INT:
        /* Interna: canal TEMPSENSOR con sample time largo */
        if (start_adc_it(s_hadc_int, ADC_CHANNEL_TEMPSENSOR, ADC_SAMPLETIME_239CYCLES_5))
            s_state = ST_WAIT_INT;
        else
            s_state = ST_START_EXT; // intenta externa si interna falló
        break;

    case ST_WAIT_INT:
        /* ISR avanzará a START_EXT */
        break;

    case ST_START_EXT:
        if (s_hadc_ext) {
            /* Externa (pot): sample time medio/alto según RC. */
            if (start_adc_it(s_hadc_ext, s_ext_chan, ADC_SAMPLETIME_71CYCLES_5))
                s_state = ST_WAIT_EXT;
            else {
                s_next_tick = now + s_period_ms;
                s_state = ST_IDLE;
            }
        } else {
            s_next_tick = now + s_period_ms;
            s_state = ST_IDLE;
        }
        break;

    case ST_WAIT_EXT:
        /* ISR volverá a IDLE y agenda próximo período */
        break;
    }
}

/* Getters (consumen el flag) */
bool sen_temp_get_internal(float *t_c)
{
    if (!t_c) return false;
    bool had = s_new_int;
    s_new_int = false;
    *t_c = s_t_int;
    return had;
}

bool sen_temp_get_external(float *t_0_100)
{
    if (!t_0_100) return false;
    bool had = s_new_ext;
    s_new_ext = false;
    *t_0_100 = s_t_ext;
    return had;
}

/* ---------- ISR de conversión completa ---------- */
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc)
{
    uint16_t raw = HAL_ADC_GetValue(hadc);

    if (hadc == s_hadc_int && (s_state == ST_WAIT_INT))
    {
        /* Interna (°C reales):
           T = (V25 - Vsense)/AVG_SLOPE + 25;  Vsense = raw * VDDA / 4095 */
        float Vsense = (raw * s_vdda) / ADC_FS;
        s_t_int = ((V25 - Vsense) / AVG_SLOPE) + 25.0f;
        s_new_int = true;

        /* Siguiente: externa */
        s_state = ST_START_EXT;
    }
    else if (hadc == s_hadc_ext && (s_state == ST_WAIT_EXT))
    {
        /* Externa (pot en PA0):
           Mapeo "a la manera que venías usando": 0..4095 -> 0..100 "grados" */
        s_t_ext = (raw * 100.0f) / ADC_FS;
        s_new_ext = true;

        /* Agenda próximo ciclo y vuelve a IDLE */
        s_next_tick = HAL_GetTick() + s_period_ms;
        s_state = ST_IDLE;
    }
}
