#ifndef SEN_TEMP_H
#define SEN_TEMP_H

#include "stm32f1xx_hal.h"
#include <stdbool.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Inicializa medición no bloqueante:
 * hadc_int  : ADC para sensor interno (típicamente &hadc1).
 * hadc_ext  : ADC para potenciómetro externo (típicamente &hadc2).
 * ext_chan  : canal del potenciómetro (p.ej. ADC_CHANNEL_0 para PA0).
 * period_ms : periodo entre mediciones (>=50 ms recomendado).
 * vdda      : VDDA en volts (3.3 si pasás 0).
 */
void sen_temp_init(ADC_HandleTypeDef *hadc_int,
                   ADC_HandleTypeDef *hadc_ext,
                   uint32_t ext_chan,
                   uint32_t period_ms,
                   float vdda);

/* Llamar periódicamente: avanza la FSM y dispara conversiones cuando toca. */
void sen_temp_update(void);

/* Devuelven true si hay dato nuevo (y consumen el flag).
 * Interna: °C reales (según V25/AVG_SLOPE).
 * Externa: "grados" de 0..100 mapeados desde el ADC (raw->0..100).
 */
bool sen_temp_get_internal(float *t_c);
bool sen_temp_get_external(float *t_0_100);

/* (Opcional) actualizar VDDA si medís Vrefint y compensás. */
void sen_temp_set_vdda(float vdda);

#ifdef __cplusplus
}
#endif
#endif /* SEN_TEMP_H */
