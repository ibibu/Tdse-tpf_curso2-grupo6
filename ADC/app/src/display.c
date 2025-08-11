/********************** inclusions *******************************************/
#include "display.h"
#include "main.h"
#include <stdbool.h>
#include <string.h>

/********************** arm_book Defines *************************************/

// Functional states
#ifndef OFF
#define OFF    0
#endif
#ifndef ON
#define ON     (!OFF)
#endif

// Electrical states
#ifndef LOW
#define LOW    0
#endif
#ifndef HIGH
#define HIGH   (!LOW)
#endif

/********************** macros and definitions *******************************/

/* Comandos básicos del LCD (HD44780) */
#define LCD_CMD_CLEAR               0x01
#define LCD_CMD_ENTRY_MODE          0x04
#define LCD_CMD_DISPLAY_CTRL        0x08
#define LCD_CMD_FUNCTION_SET        0x20
#define LCD_CMD_SET_DDRAM_ADDR      0x80

#define LCD_CMD_ENTRY_MODE_SET_INCREMENT 0x02
#define LCD_CMD_ENTRY_MODE_SET_NO_SHIFT  0x00

#define LCD_CMD_DISPLAY_CTRL_DISPLAY_ON  0x04
#define LCD_CMD_DISPLAY_CTRL_DISPLAY_OFF 0x00
#define LCD_CMD_DISPLAY_CTRL_CURSOR_OFF  0x00
#define LCD_CMD_DISPLAY_CTRL_BLINK_OFF   0x00

#define LCD_CMD_FUNCTION_SET_8BITS    0x10
#define LCD_CMD_FUNCTION_SET_4BITS    0x00
#define LCD_CMD_FUNCTION_SET_2LINES   0x08
#define LCD_CMD_FUNCTION_SET_5x8DOTS  0x00

/* Direcciones base DDRAM para 20x4 (layout típico) */
#define LCD_20X4_LINE1_DDRAM_ADDR 0
#define LCD_20X4_LINE2_DDRAM_ADDR 64
#define LCD_20X4_LINE3_DDRAM_ADDR 20
#define LCD_20X4_LINE4_DDRAM_ADDR 84

/* RS/RW/Datos */
#define LCD_RS_COMMAND 0
#define LCD_RS_DATA    1
#define LCD_RW_WRITE   0

/* Mapeo de pines lógicos del driver */
#define LCD_PIN_RS  4
#define LCD_PIN_RW  5
#define LCD_PIN_EN  6
#define LCD_PIN_D4 11
#define LCD_PIN_D5 12
#define LCD_PIN_D6 13
#define LCD_PIN_D7 14

/********************** internal data declaration ****************************/
static display_t display;
static bool initial8BitCommunicationIsCompleted;

/********************** internal functions declaration ***********************/
static void displayPinWrite(uint8_t pinName, int value);
static void displayDataBusWrite(uint8_t dataByte);
static void displayCodeWrite(bool type, uint8_t dataBus);

/* Delay en microsegundos usando DWT->CYCCNT (DWT habilitado en app_init) */
static inline void delay_us(uint32_t us) {
    uint32_t start = DWT->CYCCNT;
    uint32_t ticks = (SystemCoreClock/1000000U) * us;
    while ((DWT->CYCCNT - start) < ticks) { __NOP(); }
}

/********************** external functions definition ************************/

void displayInit()
{
    display.connection = DISPLAY_CONNECTION_GPIO_4BITS;
    initial8BitCommunicationIsCompleted = false;

    /* Secuencia de init estándar (HD44780 datasheet) */
    delay_us(15000); // >15 ms después de VCC

    // Function set (8 bits) x3
    displayCodeWrite(LCD_RS_COMMAND, LCD_CMD_FUNCTION_SET | LCD_CMD_FUNCTION_SET_8BITS);
    delay_us(4100);
    displayCodeWrite(LCD_RS_COMMAND, LCD_CMD_FUNCTION_SET | LCD_CMD_FUNCTION_SET_8BITS);
    delay_us(100);
    displayCodeWrite(LCD_RS_COMMAND, LCD_CMD_FUNCTION_SET | LCD_CMD_FUNCTION_SET_8BITS);
    delay_us(40);

    // Pasar a 4 bits
    displayCodeWrite(LCD_RS_COMMAND, LCD_CMD_FUNCTION_SET | LCD_CMD_FUNCTION_SET_4BITS);
    delay_us(40);

    initial8BitCommunicationIsCompleted = true;

    // Configuración 4 bits, 2 líneas, 5x8
    displayCodeWrite(LCD_RS_COMMAND,
                     LCD_CMD_FUNCTION_SET |
                     LCD_CMD_FUNCTION_SET_4BITS |
                     LCD_CMD_FUNCTION_SET_2LINES |
                     LCD_CMD_FUNCTION_SET_5x8DOTS);
    delay_us(40);

    // Display OFF, cursor/blink OFF
    displayCodeWrite(LCD_RS_COMMAND,
                     LCD_CMD_DISPLAY_CTRL |
                     LCD_CMD_DISPLAY_CTRL_DISPLAY_OFF |
                     LCD_CMD_DISPLAY_CTRL_CURSOR_OFF |
                     LCD_CMD_DISPLAY_CTRL_BLINK_OFF);
    delay_us(40);

    // Clear (comando “lento”)
    displayCodeWrite(LCD_RS_COMMAND, LCD_CMD_CLEAR);
    delay_us(1600);

    // Entry mode: incrementar, no shift
    displayCodeWrite(LCD_RS_COMMAND,
                     LCD_CMD_ENTRY_MODE |
                     LCD_CMD_ENTRY_MODE_SET_INCREMENT |
                     LCD_CMD_ENTRY_MODE_SET_NO_SHIFT);
    delay_us(40);

    // Display ON
    displayCodeWrite(LCD_RS_COMMAND,
                     LCD_CMD_DISPLAY_CTRL |
                     LCD_CMD_DISPLAY_CTRL_DISPLAY_ON |
                     LCD_CMD_DISPLAY_CTRL_CURSOR_OFF |
                     LCD_CMD_DISPLAY_CTRL_BLINK_OFF);
    delay_us(40);
}

void displayCharPositionWrite(uint8_t charPositionX, uint8_t charPositionY)
{
    uint8_t addr = 0;
    switch (charPositionY) {
        case 0: addr = LCD_20X4_LINE1_DDRAM_ADDR; break;
        case 1: addr = LCD_20X4_LINE2_DDRAM_ADDR; break;
        case 2: addr = LCD_20X4_LINE3_DDRAM_ADDR; break;
        case 3: addr = LCD_20X4_LINE4_DDRAM_ADDR; break;
        default: addr = LCD_20X4_LINE1_DDRAM_ADDR; break;
    }
    displayCodeWrite(LCD_RS_COMMAND, LCD_CMD_SET_DDRAM_ADDR | (addr + charPositionX));
    delay_us(40);
}

void displayStringWrite(const char *str)
{
    while (*str) {
        displayCodeWrite(LCD_RS_DATA, *str++);
        delay_us(40);  // tiempo típico instrucción “write data”
    }
}

/********************** internal functions definition ************************/

static void displayCodeWrite(bool type, uint8_t dataBus)
{
    // RS: 0 comando, 1 dato
    if (type == LCD_RS_COMMAND)
        displayPinWrite(LCD_PIN_RS, LCD_RS_COMMAND);
    else
        displayPinWrite(LCD_PIN_RS, LCD_RS_DATA);

    displayPinWrite(LCD_PIN_RW, LCD_RW_WRITE);

    // Enviar byte en dos nibbles
    displayDataBusWrite(dataBus);
}

static void displayPinWrite(uint8_t pinName, int value)
{
    // Mapeo físico de pines (igual que tu versión anterior)
    switch (pinName) {
        case LCD_PIN_D4: HAL_GPIO_WritePin(GPIOA, GPIO_PIN_10, value); break; // D4 lógico -> PA10
        case LCD_PIN_D5: HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,  value); break; // D5 lógico -> PA8
        case LCD_PIN_D6: HAL_GPIO_WritePin(GPIOA, GPIO_PIN_9,  value); break; // D6 lógico -> PA9
        case LCD_PIN_D7: HAL_GPIO_WritePin(GPIOC, GPIO_PIN_7,  value); break; // D7 lógico -> PC7
        case LCD_PIN_RS: HAL_GPIO_WritePin(GPIOB, GPIO_PIN_6,  value); break; // RS -> PB6
        case LCD_PIN_EN: HAL_GPIO_WritePin(GPIOA, GPIO_PIN_7,  value); break; // EN -> PA7
        case LCD_PIN_RW: /* no usado (write only) */ break;
        default: break;
    }
}

static void displayDataBusWrite(uint8_t dataBus)
{
    // Nibble alto
    displayPinWrite(LCD_PIN_D7, (dataBus & 0x80) ? HIGH : LOW);
    displayPinWrite(LCD_PIN_D6, (dataBus & 0x40) ? HIGH : LOW);
    displayPinWrite(LCD_PIN_D5, (dataBus & 0x20) ? HIGH : LOW);
    displayPinWrite(LCD_PIN_D4, (dataBus & 0x10) ? HIGH : LOW);

    displayPinWrite(LCD_PIN_EN, ON);
    delay_us(2);
    displayPinWrite(LCD_PIN_EN, OFF);
    delay_us(2);

    // Nibble bajo (solo tras completar init 4 bits)
    if (initial8BitCommunicationIsCompleted) {
        displayPinWrite(LCD_PIN_D7, (dataBus & 0x08) ? HIGH : LOW);
        displayPinWrite(LCD_PIN_D6, (dataBus & 0x04) ? HIGH : LOW);
        displayPinWrite(LCD_PIN_D5, (dataBus & 0x02) ? HIGH : LOW);
        displayPinWrite(LCD_PIN_D4, (dataBus & 0x01) ? HIGH : LOW);

        displayPinWrite(LCD_PIN_EN, ON);
        delay_us(2);
        displayPinWrite(LCD_PIN_EN, OFF);
        delay_us(2);
    }
}
