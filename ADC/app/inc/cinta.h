// cinta.h
#ifndef CINTA_H
#define CINTA_H

#include <stdint.h>
#include <stdbool.h>
#include "stm32f1xx_hal.h"  // Para usar I2C_HandleTypeDef
#include "eprom.h"          // Funciones de acceso a EEPROM

// Estructura que representa el estado de la cinta transportadora
typedef struct {
    int8_t velocidad;        // 0 = lenta, 1 = media, 2 = rápida
    int8_t modo;             // 0 = Error, 1 = manual, 2 = automático
} Cinta;

// Configuración de almacenamiento en EEPROM
#define EPROM_BASE_ADDR       0x0000
#define EPROM_CINTA_SIZE      sizeof(Cinta)
#define EPROM_MAX_ENTRADAS    16384  // 32768 / 2 (nuevo tamaño sin temperatura)

// Funciones de EEPROM
bool guardar_cinta_en_eprom(uint16_t idx, Cinta *ptr_cinta);
bool leer_cinta_de_eprom(uint16_t idx, Cinta *ptr_cinta);
bool cinta_cambio(Cinta *a, Cinta *b);

// Funciones de manejo de estructura Cinta
void cinta_inicializar(Cinta *ptr);
void cinta_set_velocidad(Cinta *ptr, int8_t nueva_velocidad);
int8_t cinta_get_velocidad(Cinta *ptr);
void cinta_set_modo(Cinta *ptr, int8_t nuevo_modo);
int8_t cinta_get_modo(Cinta *ptr);

#endif // CINTA_H
