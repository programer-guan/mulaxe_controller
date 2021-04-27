#ifndef UART_DEMO_H
#define UART_DEMO_H

#include "uart.h"
#include "syscon.h"

extern uint8_t read_buf[20];
extern uint8_t parameter_buf[20];

extern uint8_t  NH,NL,Go;
extern uint16_t FS_0,FS_1,FS_2,FS_3,FS_4,FS_5,FS_6,FS_7,FS_8,FS_9,FS_A,FS_B,FS_C,FS_D,FS_E,FS_F;
extern uint16_t Ms_0,Ms_1,Ms_2,Ms_3,Ms_4,Ms_5,Ms_6,Ms_7,Ms_8,Ms_9,Ms_A,Ms_B,Ms_C,Ms_D,Ms_E,Ms_F;
extern uint32_t FO_0,FO_1,FO_2,FO_3,FO_4,FO_5,FO_6,FO_7,FO_8,FO_9,FO_A,FO_B,FO_C,FO_D,FO_E,FO_F;
extern uint32_t Npulse_0,Npulse_1,Npulse_2,Npulse_3,Npulse_4,Npulse_5,Npulse_6,Npulse_7,Npulse_8,Npulse_9,Npulse_A,Npulse_B,Npulse_C,Npulse_D,Npulse_E,Npulse_F;

void UART_INIT(void);

void uart_rx_finish(void *param, uint8_t status);
void test_uart_rx_finish(void *param, uint8_t status);
#endif
