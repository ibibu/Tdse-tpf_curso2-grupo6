#include <task_actuator.h>

/********************** Configuración estática *******************************/
/* Tabla con la configuración de los 3 actuadores (LEDs) */
static const task_actuator_cfg_t actuadores_cfg[LED_QTY] = {
    {LED_1, GPIOA, GPIO_PIN_0, GPIO_PIN_SET, GPIO_PIN_RESET, 300}, // LED 1 en PA0
    {LED_2, GPIOA, GPIO_PIN_1, GPIO_PIN_SET, GPIO_PIN_RESET, 300}, // LED 2 en PA1
    {LED_3, GPIOA, GPIO_PIN_2, GPIO_PIN_SET, GPIO_PIN_RESET, 300}  // LED 3 en PA2
};

/********************** Datos dinámicos **************************************/
static task_actuator_dta_t actuadores_dta[LED_QTY];

/********************** Implementación ****************************************/
/**

 */
void actuadores_init(void)
{
    for (int i = 0; i < LED_QTY; i++) {
        actuadores_dta[i].state = ST_LED_XX_OFF;
        actuadores_dta[i].event = EV_LED_XX_TURN_OFF;
        actuadores_dta[i].tick = 0;
        actuadores_dta[i].flag = false;

        // Apagar físicamente el LED
        HAL_GPIO_WritePin(actuadores_cfg[i].gpio_port, actuadores_cfg[i].pin, actuadores_cfg[i].led_off);
    }
}

/**

 */
void actuadores_update(void)
{
    for (int i = 0; i < LED_QTY; i++) {
        const task_actuator_cfg_t *cfg = &actuadores_cfg[i];
        task_actuator_dta_t *dta = &actuadores_dta[i];

        switch (dta->state) {
        case ST_LED_XX_OFF:
            if (dta->event == EV_LED_XX_TURN_ON) {
                HAL_GPIO_WritePin(cfg->gpio_port, cfg->pin, cfg->led_on);
                dta->state = ST_LED_XX_ON;
            }
            else if (dta->event == EV_LED_XX_BLINKING_ON) {
                dta->tick = cfg->tick_blink;
                dta->flag = true;
                HAL_GPIO_WritePin(cfg->gpio_port, cfg->pin, cfg->led_on);
                dta->state = ST_LED_XX_BLINK;
            }
            break;

        case ST_LED_XX_ON:
            if (dta->event == EV_LED_XX_TURN_OFF) {
                HAL_GPIO_WritePin(cfg->gpio_port, cfg->pin, cfg->led_off);
                dta->state = ST_LED_XX_OFF;
            }
            else if (dta->event == EV_LED_XX_BLINKING_ON) {
                dta->tick = cfg->tick_blink;
                dta->flag = true;
                dta->state = ST_LED_XX_BLINK;
            }
            break;

        case ST_LED_XX_BLINK:
            if (dta->event == EV_LED_XX_BLINKING_OFF) {
                HAL_GPIO_WritePin(cfg->gpio_port, cfg->pin, cfg->led_off);
                dta->state = ST_LED_XX_OFF;
                break;
            }

            if (dta->tick > 0) {
                dta->tick--;
            } else {
                dta->tick = cfg->tick_blink;
                dta->flag = !dta->flag;
                HAL_GPIO_WritePin(cfg->gpio_port, cfg->pin, dta->flag ? cfg->led_on : cfg->led_off);
            }
            break;
        }

        // Reset event para no re-procesarlo infinitamente
        dta->event = (dta->state == ST_LED_XX_OFF) ? EV_LED_XX_TURN_OFF :
                     (dta->state == ST_LED_XX_ON)  ? EV_LED_XX_TURN_ON :
                     EV_LED_XX_BLINKING_ON;
    }
}

/**
 * 
 * Envía un evento a la FSM del actuador seleccionado.
 * id Identificador del actuador (LED_1, LED_2, LED_3).
 * event Evento (EV_LED_XX_TURN_ON, EV_LED_XX_TURN_OFF, etc.).
 */
void actuadores_enviar_evento(task_actuator_id_t id, task_actuator_ev_t event)
{
    if (id < LED_QTY) {
        actuadores_dta[id].event = event;
    }
}
