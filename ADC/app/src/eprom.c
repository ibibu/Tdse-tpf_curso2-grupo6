#include "eprom.h"
#include "main.h"

bool EPROM_WriteByte(I2C_HandleTypeDef *hi2c, uint16_t mem_address, uint8_t data) {
    uint8_t buf[3];
    buf[0] = (uint8_t)(mem_address >> 8);
    buf[1] = (uint8_t)(mem_address & 0xFF);
    buf[2] = data;

    if (HAL_I2C_Master_Transmit(hi2c, EPROM_I2C_ADDRESS, buf, 3, HAL_MAX_DELAY) != HAL_OK)
        return false;

    HAL_Delay(EPROM_WRITE_DELAY_MS);
    return true;
}

bool EPROM_ReadByte(I2C_HandleTypeDef *hi2c, uint16_t mem_address, uint8_t *data) {
    uint8_t addr[2];
    addr[0] = (uint8_t)(mem_address >> 8);
    addr[1] = (uint8_t)(mem_address & 0xFF);

    if (HAL_I2C_Master_Transmit(hi2c, EPROM_I2C_ADDRESS, addr, 2, HAL_MAX_DELAY) != HAL_OK)
        return false;

    if (HAL_I2C_Master_Receive(hi2c, EPROM_I2C_ADDRESS, data, 1, HAL_MAX_DELAY) != HAL_OK)
        return false;

    return true;
}

bool EPROM_WriteBuffer(I2C_HandleTypeDef *hi2c, uint16_t mem_address, uint8_t *data, uint16_t size) {
    for (uint16_t i = 0; i < size; i++) {
        if (!EPROM_WriteByte(hi2c, mem_address + i, data[i]))
            return false;
    }
    return true;
}

bool EPROM_ReadBuffer(I2C_HandleTypeDef *hi2c, uint16_t mem_address, uint8_t *data, uint16_t size) {
    for (uint16_t i = 0; i < size; i++) {
        if (!EPROM_ReadByte(hi2c, mem_address + i, &data[i]))
            return false;
    }
    return true;
}
