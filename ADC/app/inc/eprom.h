#ifndef EPROM_H
#define EPROM_H

#include "stm32f1xx_hal.h"  // Header correcto para STM32F103RB
#include <stdint.h>
#include <stdbool.h>

// Dirección base típica de memorias 24Cxx con A0-A2 a GND
#define EPROM_I2C_ADDRESS      (0x50 << 1)
#define EPROM_WRITE_DELAY_MS   5  // Tiempo típico de escritura (ajustable)

#ifdef __cplusplus
extern "C" {
#endif

// Funciones públicas para escritura/lectura
bool EPROM_WriteByte(I2C_HandleTypeDef *hi2c, uint16_t mem_address, uint8_t data);
bool EPROM_ReadByte(I2C_HandleTypeDef *hi2c, uint16_t mem_address, uint8_t *data);
bool EPROM_WriteBuffer(I2C_HandleTypeDef *hi2c, uint16_t mem_address, uint8_t *data, uint16_t size);
bool EPROM_ReadBuffer(I2C_HandleTypeDef *hi2c, uint16_t mem_address, uint8_t *data, uint16_t size);

#ifdef __cplusplus
}
#endif

#endif // EPROM_H
