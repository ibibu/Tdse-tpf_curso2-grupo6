#ifndef INC_DISPLAY_H_
#define INC_DISPLAY_H_

/********************** CPP guard ********************************************/
#ifdef __cplusplus
extern "C" {
#endif

/********************** inclusions *******************************************/
#include <stdint.h>
/********************** macros ***********************************************/

/********************** typedef **********************************************/

/********************** external data declaration ****************************/
typedef enum {
     DISPLAY_CONNECTION_GPIO_4BITS
} displayConnection_t;

/*Display está conectado usando una interfaz GPIO de 4 bits*/

typedef struct {
   displayConnection_t connection;
} display_t;

/*Estructura que define una instancia del display, que guarda al menos el tipo de conexión*/

/********************** external functions declaration ***********************/
void displayInit( ); // Inicializa el Display

void displayCharPositionWrite( uint8_t charPositionX, uint8_t charPositionY ); 
/*Posiciona el cursor del display en la coordenada (x, y)*/

void displayStringWrite( const char * str );
/*Escribe una cadena de caracteres en el display desde la posición actual del cursor*/

#endif /* INC_DISPLAY_H_ */