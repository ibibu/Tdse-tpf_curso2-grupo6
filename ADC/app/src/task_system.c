#include "cinta.h"
#include "task_sensor.h"
#include "display.h"
#include "eprom.h"
#include "main.h"
#include "stm32f1xx_hal.h"
#include <stdio.h>
#include <string.h>
#include <task_sensor_temperature.h>
#include <task_system.h>
#include "logger.h"

/* === Helpers DWT (app_init ya habilita DWT->CYCCNT) === */
static inline uint32_t dwt_cycles(void) { return DWT->CYCCNT; }
static inline uint32_t cycles_to_us(uint32_t cycles){
    return (uint32_t)(((uint64_t)cycles * 1000000ull) / (uint64_t)SystemCoreClock);
}

/* === Profiling por secciones dentro de task_sistema === */
typedef enum { SEC_IN=0, SEC_LOGIC, SEC_EE, SEC_LCD, SEC_LED, SEC_QTY } sec_id_t;
typedef struct {
    const char *name;
    uint32_t last_us;
    uint32_t wcet_us;
    uint32_t calls;
} sys_sec_prof_t;

static volatile sys_sec_prof_t g_sys_prof[SEC_QTY] = {
    [SEC_IN]    = { "IN",  0, 0, 0 },
    [SEC_LOGIC] = { "LG",  0, 0, 0 },
    [SEC_EE]    = { "EE",  0, 0, 0 },
    [SEC_LCD]   = { "LCD", 0, 0, 0 },
    [SEC_LED]   = { "LED", 0, 0, 0 },
};

static inline void sec_start(uint32_t *t0){ *t0 = dwt_cycles(); }
static inline void sec_end(sec_id_t id, uint32_t t0){
    uint32_t dt_us = cycles_to_us(dwt_cycles() - t0);
    g_sys_prof[id].last_us = dt_us;
    g_sys_prof[id].calls++;
    if (dt_us > g_sys_prof[id].wcet_us) g_sys_prof[id].wcet_us = dt_us;
}

/* === Estado previo (tu lógica) === */
static Cinta cinta_actual;
static uint8_t velocidad_guardada = 0;
static uint8_t contador_auto = 0;
static uint32_t last_pulse_tick = 0;
static float tin_c = 0.0f;  // interna °C
static float tex_g = 0.0f;  // externa 0..100

#define INTERVALO_RESET_MS   10000
#define TEMP_MAX             80
#define EEPROM_ADDR_MODO     0x00
#define EEPROM_ADDR_VEL      0x01
#define SISTEMA_PERIOD_MS    50   // UI (LCD) a 20 Hz

extern I2C_HandleTypeDef hi2c1;

/* --- UI throttle: solo LCD --- */
static uint32_t ui_next_ms = 0; // 0 = refresco inmediato

/* --- EEPROM helpers (cronometrados) --- */
static void guardar_configuracion(void){
    uint32_t t0; sec_start(&t0);
    if (cinta_get_modo(&cinta_actual) != 0) {
        EPROM_WriteByte(&hi2c1, EEPROM_ADDR_MODO, (uint8_t)cinta_get_modo(&cinta_actual));
        EPROM_WriteByte(&hi2c1, EEPROM_ADDR_VEL,  (uint8_t)velocidad_guardada);
    }
    sec_end(SEC_EE, t0);
}

static void leer_configuracion(void){
    uint8_t modo_leido = 1;
    uint8_t vel_leida  = 0;
    EPROM_ReadByte(&hi2c1, EEPROM_ADDR_MODO, &modo_leido);
    EPROM_ReadByte(&hi2c1, EEPROM_ADDR_VEL,  &vel_leida);

    if (modo_leido == 1 || modo_leido == 2)
        cinta_set_modo(&cinta_actual, (int8_t)modo_leido);
    else
        cinta_set_modo(&cinta_actual, 1);

    velocidad_guardada = (vel_leida <= 2) ? vel_leida : 0;
    cinta_set_velocidad(&cinta_actual, (int8_t)velocidad_guardada);
}

/* === Dump de secciones (solo si app.c define TASK_SISTEMA_PROF_ENABLED) === */
#ifdef TASK_SISTEMA_PROF_ENABLED
void task_sistema_prof_dump(void){
    LOGGER_LOG("SYS SEC WCET(us): IN=%lu LG=%lu EE=%lu LCD=%lu LED=%lu\r\n",
        (unsigned long)g_sys_prof[SEC_IN].wcet_us,
        (unsigned long)g_sys_prof[SEC_LOGIC].wcet_us,
        (unsigned long)g_sys_prof[SEC_EE].wcet_us,
        (unsigned long)g_sys_prof[SEC_LCD].wcet_us,
        (unsigned long)g_sys_prof[SEC_LED].wcet_us);
}
#endif

/* === Init / Update === */
void task_sistema_init(void *params)
{
    cinta_inicializar(&cinta_actual);
    HAL_Delay(100);
    displayInit();

    leer_configuracion();

    displayCharPositionWrite(0, 0);
    displayStringWrite("Sistema Listo ");
    displayCharPositionWrite(0, 1);
    displayStringWrite("Iniciando...");
    HAL_Delay(300);

    ui_next_ms = 0; // primer refresh inmediato
}

void task_sistema_update(void *params)
{
    uint32_t t0;

    /* --- IN: Sensado no bloqueante --- */
    sec_start(&t0);
    sen_temp_update();
    float ttmp;
    if (sen_temp_get_internal(&ttmp)) tin_c = ttmp;
    if (sen_temp_get_external(&ttmp)) tex_g = ttmp;
    sec_end(SEC_IN, t0);

    /* --- LG: Lógica (protección + botones + FSM + resets) --- */
    sec_start(&t0);

    // Protección por temperatura
    if ((tin_c > (float)TEMP_MAX) || (tex_g > (float)TEMP_MAX)) {
        if (cinta_get_modo(&cinta_actual) != 0) {
            cinta_set_modo(&cinta_actual, 0);
            cinta_set_velocidad(&cinta_actual, 0);
            velocidad_guardada = 0;
            contador_auto = 0;
            ui_next_ms = 0;
        }
    }

    // BTN_2: Falla ON/OFF
    if (task_sensor_get_edge(BTN_2)) {
        if (cinta_get_modo(&cinta_actual) != 0) {
            cinta_set_modo(&cinta_actual, 0);
            cinta_set_velocidad(&cinta_actual, 0);
            velocidad_guardada = 0;
            contador_auto = 0;
        } else {
            cinta_set_modo(&cinta_actual, 1);
            cinta_set_velocidad(&cinta_actual, 0);
        }
        guardar_configuracion();
        ui_next_ms = 0;
    }

    // BTN_3: Manual/Auto
    if (task_sensor_get_edge(BTN_3) && cinta_get_modo(&cinta_actual) != 0) {
        if (cinta_get_modo(&cinta_actual) == 1) {
            cinta_set_modo(&cinta_actual, 2);
            contador_auto = 0;
            last_pulse_tick = HAL_GetTick();
            cinta_set_velocidad(&cinta_actual, (int8_t)velocidad_guardada);
        } else {
            cinta_set_modo(&cinta_actual, 1);
            cinta_set_velocidad(&cinta_actual, (int8_t)velocidad_guardada);
        }
        guardar_configuracion();
        ui_next_ms = 0;
    }

    // BTN_4: Velocidad (en manual)
    if (cinta_get_modo(&cinta_actual) == 1 && task_sensor_get_edge(BTN_4)) {
        velocidad_guardada = (uint8_t)((velocidad_guardada + 1) % 3);
        cinta_set_velocidad(&cinta_actual, (int8_t)velocidad_guardada);
        guardar_configuracion();
        ui_next_ms = 0;
    }

    // BTN_1: Contador (en auto)
    if (cinta_get_modo(&cinta_actual) == 2 && task_sensor_get_edge(BTN_1)) {
        contador_auto++;
        last_pulse_tick = HAL_GetTick();
        velocidad_guardada = (contador_auto >= 2) ? 2 : 1;
        cinta_set_velocidad(&cinta_actual, (int8_t)velocidad_guardada);
        guardar_configuracion();
        ui_next_ms = 0;
    }

    // Reset auto tras 10 s sin pulsos
    if (cinta_get_modo(&cinta_actual) == 2 &&
        (HAL_GetTick() - last_pulse_tick) >= INTERVALO_RESET_MS) {
        contador_auto = 0;
        velocidad_guardada = 0;
        cinta_set_velocidad(&cinta_actual, 0);
        guardar_configuracion();
        ui_next_ms = 0;
    }

    sec_end(SEC_LOGIC, t0);

    /* --- LED: siempre inmediato (barato) --- */
    sec_start(&t0);
    if (cinta_get_modo(&cinta_actual) == 0) {
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_SET);
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_6, GPIO_PIN_RESET);
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_5, GPIO_PIN_RESET);
    } else {
        int vel = cinta_get_velocidad(&cinta_actual);
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_6, (vel == 0) ? GPIO_PIN_SET : GPIO_PIN_RESET);
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_5, (vel > 0) ? GPIO_PIN_SET : GPIO_PIN_RESET);
    }
    sec_end(SEC_LED, t0);

    /* --- LCD: throttle 50 ms, refresca solo si cambió --- */
    uint32_t now = HAL_GetTick();
    if (ui_next_ms != 0 && (int32_t)(now - ui_next_ms) < 0) return;
    ui_next_ms = now + SISTEMA_PERIOD_MS;

    sec_start(&t0);

    static char prevL0[24] = {0}, prevL1[24] = {0}, prevL2[24] = {0};
    char L0[24], L1[24], L2[24];

    snprintf(L0, sizeof L0,
             (cinta_get_modo(&cinta_actual)==0) ? "MODO: FALLA  " :
             (cinta_get_modo(&cinta_actual)==1) ? "MODO: MANUAL " :
                                                  "MODO: AUTO   ");

    int vel_display = (cinta_get_modo(&cinta_actual)==0) ? 0 : cinta_get_velocidad(&cinta_actual);
    snprintf(L1, sizeof L1, "VEL:%d  PAQ:%05u", vel_display, (unsigned)contador_auto);

    int tin10 = (int)(tin_c * 10.0f + (tin_c >= 0 ? 0.5f : -0.5f));
    int tex   = (int)(tex_g + 0.5f);
    snprintf(L2, sizeof L2, "TIn:%3d.%01dC TEx:%3dC",
             tin10/10, (tin10 < 0 ? -(tin10%10) : (tin10%10)), tex);

    if (strcmp(L0, prevL0)!=0) { displayCharPositionWrite(0,0); displayStringWrite(L0); strcpy((char*)prevL0,L0); }
    if (strcmp(L1, prevL1)!=0) { displayCharPositionWrite(0,1); displayStringWrite(L1); strcpy((char*)prevL1,L1); }
    if (strcmp(L2, prevL2)!=0) { displayCharPositionWrite(0,2); displayStringWrite(L2); strcpy((char*)prevL2,L2); }

    sec_end(SEC_LCD, t0);
}

/* Getter para APP: devuelve last y wcet por sección
   Orden: [0]=IN, [1]=LG, [2]=EE, [3]=LCD, [4]=LED */
void task_sistema_prof_get(uint32_t out_last_us[5], uint32_t out_wcet_us[5])
{
    if (!out_last_us || !out_wcet_us) return;

    out_last_us[0] = g_sys_prof[SEC_IN].last_us;
    out_last_us[1] = g_sys_prof[SEC_LOGIC].last_us;
    out_last_us[2] = g_sys_prof[SEC_EE].last_us;
    out_last_us[3] = g_sys_prof[SEC_LCD].last_us;
    out_last_us[4] = g_sys_prof[SEC_LED].last_us;

    out_wcet_us[0] = g_sys_prof[SEC_IN].wcet_us;
    out_wcet_us[1] = g_sys_prof[SEC_LOGIC].wcet_us;
    out_wcet_us[2] = g_sys_prof[SEC_EE].wcet_us;
    out_wcet_us[3] = g_sys_prof[SEC_LCD].wcet_us;
    out_wcet_us[4] = g_sys_prof[SEC_LED].wcet_us;
}


