#include "task_sensor.h"
#include "stm32f1xx_hal.h"

#define DEBOUNCE_MS 3
#define SCHEDULER_TICK_MS 1
#define DEBOUNCE_TICKS (DEBOUNCE_MS / SCHEDULER_TICK_MS)


typedef struct {
    GPIO_TypeDef *port;
    uint16_t pin;
    bool stable_state;
    bool last_state;
    uint32_t counter;
    bool edge_flag;
} button_t;

static button_t botones[BTN_QTY] = {
    {GPIOB, GPIO_PIN_15, false, false, 0, false}, // BTN_1
    {GPIOB, GPIO_PIN_14, false, false, 0, false}, // BTN_2
    {GPIOB, GPIO_PIN_13, false, false, 0, false}, // BTN_3
    {GPIOB, GPIO_PIN_12, false, false, 0, false}  // BTN_4
};

void task_sensor_init(void *parameters)
{
    for (int i = 0; i < BTN_QTY; i++) {
        botones[i].stable_state = false;
        botones[i].last_state = false;
        botones[i].counter = 0;
        botones[i].edge_flag = false;
    }
}

void task_sensor_update(void *parameters)
{
    for (int i = 0; i < BTN_QTY; i++) {
        bool raw = (HAL_GPIO_ReadPin(botones[i].port, botones[i].pin) == GPIO_PIN_RESET);

        if (raw != botones[i].stable_state) {
            if (++botones[i].counter >= DEBOUNCE_TICKS) {
                botones[i].stable_state = raw;
                botones[i].counter = 0;

                if (botones[i].stable_state) {
                    botones[i].edge_flag = true; // Flanco DOWN
                }
            }
        } else {
            botones[i].counter = 0; // Solo reinicia si está igual
        }
    }
}


bool task_sensor_get_state(task_sensor_id_t id)
{
    return botones[id].stable_state;
}

bool task_sensor_get_edge(task_sensor_id_t id)
{
    if (botones[id].edge_flag) {
        botones[id].edge_flag = false; // Consumir evento
        return true;
    }
    return false;
}
