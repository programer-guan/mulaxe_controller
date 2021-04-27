#ifndef PULSE_DEMO_H
#define PULSE_DEMO_H

#define AHB_In32(Addr)  (*(volatile uint32_t *)(Addr))
#define AHB_Out32(Addr, Value) \
												(*(volatile uint32_t *)((Addr)) = (Value))  
#define AHB_BaseAddr0       0x20008000
#define AHB_BaseAddr1       0x2000A000
#define AHB_BaseAddr2       0x2000C000
#define AHB_BaseAddr3       0x2000E000
#define AHB_BaseAddr4       0x20009000
#define AHB_BaseAddr5       0x2000D000
		

extern uint8_t  CHn_state[8],M_0,M_1,M_2,M_3,M_4,M_5,M_6,M_7,M_8,M_9,M_A,M_B,M_C,M_D,M_E,M_F;												
extern uint32_t pnumcnt,state,rd_state,limit,timer;
extern uint32_t pnumcnt_0,pnumcnt_1,pnumcnt_2,pnumcnt_3,pnumcnt_4,pnumcnt_5,pnumcnt_6,pnumcnt_7,pnumcnt_8,pnumcnt_9,pnumcnt_A,pnumcnt_B,pnumcnt_C,pnumcnt_D,pnumcnt_E,pnumcnt_F;
extern uint32_t pulsenub_0,pulsenub_1,pulsenub_2,pulsenub_3,pulsenub_4,pulsenub_5,pulsenub_6,pulsenub_7,pulsenub_8,pulsenub_9,pulsenub_A,pulsenub_B,pulsenub_C,pulsenub_D,pulsenub_E,pulsenub_F;
extern uint32_t Npulse_send0,Npulse_send1,Npulse_send2,Npulse_send3,Npulse_send4,Npulse_send5,Npulse_send6,Npulse_send7,Npulse_send8,Npulse_send9,Npulse_sendA,Npulse_sendB,Npulse_sendC,Npulse_sendD,Npulse_sendE,Npulse_sendF;

extern uint32_t n_0,n_1,n_2,n_3,n_4,n_5,n_6,n_7,n_8,n_9,n_A,n_B,n_C,n_D,n_E,n_F;
												
void AHB_SENDING(void);
void CHn_Message_Send(void);
void CHn_ORDER_SEND(uint8_t nh,uint8_t nl,uint8_t go);
												
#endif
