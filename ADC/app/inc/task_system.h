// task_system.h
#ifndef SISTEMA_H_
#define SISTEMA_H_

#ifdef __cplusplus
extern "C" {
#endif

void task_sistema_init(void *params);
void task_sistema_update(void *params);

/* Orden: [0]=IN, [1]=LG, [2]=EE, [3]=LCD, [4]=LED */
void task_sistema_prof_get(uint32_t out_last_us[5], uint32_t out_wcet_us[5]);

#ifdef __cplusplus
}
#endif
#endif /* SISTEMA_H_ */
