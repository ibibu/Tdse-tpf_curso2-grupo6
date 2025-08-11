#ifndef ACTUADORES_H_
#define ACTUADORES_H_

#include "stm32f1xx_hal.h"
#include <stdbool.h>
#include <stdint.h>

/********************** Enumeraciones ****************************************/
/* Eventos que controlan la FSM del actuador */
typedef enum task_actuator_ev {
    EV_LED_XX_TURN_OFF,       // Apagar LED
    EV_LED_XX_TURN_ON,        // Encender LED
    EV_LED_XX_BLINKING_OFF,   // Detener parpadeo
    EV_LED_XX_BLINKING_ON     // Iniciar parpadeo
} task_actuator_ev_t;

/* Estados posibles de cada actuador */
typedef enum task_actuator_st {
    ST_LED_XX_OFF,    // Apagado
    ST_LED_XX_ON,     // Encendido fijo
    ST_LED_XX_BLINK   // Parpadeando
} task_actuator_st_t;

/* Identificadores de actuadores (en este caso 3 LEDs) */
typedef enum task_actuator_id {
    LED_1 = 0,
    LED_2,
    LED_3,
    LED_QTY            // Cantidad total de LEDs
} task_actuator_id_t;

/********************** Estructuras ******************************************/
/* Configuración estática del actuador */
typedef struct {
    task_actuator_id_t identifier;
    GPIO_TypeDef *gpio_port;    // Puerto del GPIO
    uint16_t pin;               // Pin del GPIO
    GPIO_PinState led_on;       // Nivel lógico para encendido
    GPIO_PinState led_off;      // Nivel lógico para apagado
    uint32_t tick_blink;        // Tiempo base para parpadeo (en ticks)
} task_actuator_cfg_t;

/* Datos dinámicos (estado actual del actuador) */
typedef struct {
    uint32_t tick;              // Contador para manejo de tiempo en parpadeo
    task_actuator_st_t state;   // Estado actual (OFF, ON, BLINK)
    task_actuator_ev_t event;   // Último evento a procesar
    bool flag;                  // ON/OFF interno en modo BLINK
} task_actuator_dta_t;

/**
 * Inicializa todos los actuadores (estado OFF).
 */
void actuadores_init(void);

/**
 * Actualiza la FSM de actuadores (debe llamarse periódicamente).
 */
void actuadores_update(void);

/**
 * Envía un evento a la FSM del actuador indicado.
 * id Identificador del actuador (LED_1, LED_2, LED_3).
 * event Evento a aplicar (TURN_ON, TURN_OFF, BLINKING_ON, BLINKING_OFF).
 */
void actuadores_enviar_evento(task_actuator_id_t id, task_actuator_ev_t event);

#endif /* ACTUADORES_H_ */
