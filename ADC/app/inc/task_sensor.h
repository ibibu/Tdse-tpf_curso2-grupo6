#ifndef TASK_SENSOR_H_
#define TASK_SENSOR_H_

#include "stm32f1xx_hal.h"
#include <stdint.h>
#include <stdbool.h>

/********************** Enumeraciones ****************************************/
/* Estados posibles de cada botón */
typedef enum {
    ST_BTN_UP,
    ST_BTN_FALLING,
    ST_BTN_DOWN,
    ST_BTN_RISING
} task_sensor_state_t;

/* Identificadores de botones */
typedef enum {
    BTN_1 = 0,  // Contador Automático (PB15)
    BTN_2,      // Modo Falla (PB14)
    BTN_3,      // Cambio Manual / Automático (PB13)
    BTN_4,      // Cambio Velocidad (PB12)
    BTN_QTY
} task_sensor_id_t;

/********************** Estructuras ******************************************/
typedef struct {
    task_sensor_id_t id;
    GPIO_TypeDef *port;
    uint16_t pin;
    GPIO_PinState pressed_level; // Nivel lógico presionado
    uint32_t tick_max;           // Tiempo de debounce
} task_sensor_cfg_t;

typedef struct {
    uint32_t tick;
    task_sensor_state_t state;
    bool is_pressed;
} task_sensor_dta_t;

/********************** Funciones públicas ***********************************/
void task_sensor_init(void *parameters);
void task_sensor_update(void *parameters);
bool task_sensor_get_state(task_sensor_id_t id);
bool task_sensor_get_edge(task_sensor_id_t id);


#endif /* TASK_SENSOR_H_ */
