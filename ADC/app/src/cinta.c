#include "cinta.h"
#include "eprom.h"
#include "logger.h"
#include "main.h"

extern I2C_HandleTypeDef hi2c1;

// Guarda una estructura Cinta en una posición específica de la EEPROM
bool guardar_cinta_en_eprom(uint16_t idx, Cinta *ptr_cinta)
{
    if (idx >= EPROM_MAX_ENTRADAS)
        return false;

    uint16_t direccion = EPROM_BASE_ADDR + idx * EPROM_CINTA_SIZE;

    return EPROM_WriteBuffer(&hi2c1, direccion, (uint8_t*)ptr_cinta, EPROM_CINTA_SIZE);
}

// Lee una estructura Cinta desde una posición específica de la EEPROM
bool leer_cinta_de_eprom(uint16_t idx, Cinta *ptr_cinta)
{
    if (idx >= EPROM_MAX_ENTRADAS)
        return false;

    uint16_t direccion = EPROM_BASE_ADDR + idx * EPROM_CINTA_SIZE;

    return EPROM_ReadBuffer(&hi2c1, direccion, (uint8_t*)ptr_cinta, EPROM_CINTA_SIZE);
}

// Compara dos estructuras Cinta y retorna true si hay diferencia
bool cinta_cambio(Cinta *a, Cinta *b)
{
    return (a->velocidad != b->velocidad) ||
           (a->modo != b->modo);
}

// Inicializa todos los campos de la estructura Cinta en cero
void cinta_inicializar(Cinta *ptr)
{
    ptr->velocidad = 0;
    ptr->modo = 0;
}

// Setters

void cinta_set_velocidad(Cinta *ptr, int8_t nueva_velocidad)
{
    ptr->velocidad = nueva_velocidad;
}

void cinta_set_modo(Cinta *ptr, int8_t nuevo_modo)
{
    ptr->modo = nuevo_modo;

    // Si se setea modo en 0 (Error), forzar velocidad a 0
    if (nuevo_modo == 0) {
        ptr->velocidad = 0;
    }
}
// Getters

int8_t cinta_get_velocidad(Cinta *ptr)
{
    return ptr->velocidad;
}

int8_t cinta_get_modo(Cinta *ptr)
{
    return ptr->modo;
}
