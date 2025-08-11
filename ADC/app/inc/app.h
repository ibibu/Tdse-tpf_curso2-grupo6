/*
 * Copyright (c) 2025 Ignacio Botbol.
 * Todos los derechos reservados.
 *
 * Este archivo define la interfaz pública del módulo de aplicación.
 *
 * @file   : app.h
 * @date   : Ago 2, 2025
 * @autor  : Ignacio Botbol
 * @version: v1.0.0
 */

#ifndef APP_INC_APP_H_
#define APP_INC_APP_H_

/********************** CPP guard ********************************************/
#ifdef __cplusplus
extern "C" {
#endif

/********************** Inclusiones ******************************************/
#include <stdint.h>

/********************** Declaración de variables externas ********************/

/* Contador global de ciclos (incrementa en cada actualización) */
extern uint32_t g_app_cnt;

/* Contador de ticks para disparar las tareas */
extern volatile uint32_t g_app_tick_cnt;

/********************** Declaración de funciones *****************************/

/**
 * @brief Inicializa la aplicación y todas las tareas registradas.
 */
void app_init(void);

/**
 * @brief Ejecuta la lógica de la aplicación, recorriendo las tareas.
 */
void app_update(void);

/********************** Fin de CPP guard *************************************/
#ifdef __cplusplus
}
#endif

#endif /* APP_INC_APP_H_ */

/********************** Fin del archivo **************************************/
