#ifndef TIME_DEMO_H
#define TIME_DEMO_H

extern uint32_t I_0,I_1,I_2,I_3,I_4,I_5,I_6,I_7,I_8,I_9,I_A,I_B,I_C,I_D,I_E,I_F;
extern uint32_t u_0,u_1,u_2,u_3,u_4,u_5,u_6,u_7,u_8,u_9,u_A,u_B,u_C,u_D,u_E,u_F;

void timer_isr(void *param);
void TIMER_INIT(void);

void CH0_OPREA(void);
void CH1_OPREA(void);
void CH2_OPREA(void);
void CH3_OPREA(void);
void CH4_OPREA(void);
void CH5_OPREA(void);
void CH6_OPREA(void);
void CH7_OPREA(void);
void CH8_OPREA(void);
void CH9_OPREA(void);
void CHA_OPREA(void);
void CHB_OPREA(void);
void CHC_OPREA(void);
void CHD_OPREA(void);
void CHE_OPREA(void);
void CHF_OPREA(void);

#endif
