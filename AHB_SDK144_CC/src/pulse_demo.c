#include <stdint.h>
#include "intc.h"
#include "uart.h"
#include "uart_demo.h"
#include "pulse_demo.h"
#include "int_register.h"

uint8_t  CHn_state[8],M_0,M_1,M_2,M_3,M_4,M_5,M_6,M_7,M_8,M_9,M_A,M_B,M_C,M_D,M_E,M_F;
uint32_t pnumcnt,state,rd_state;
uint32_t pnumcnt_0,pnumcnt_1,pnumcnt_2,pnumcnt_3,pnumcnt_4,pnumcnt_5,pnumcnt_6,pnumcnt_7,pnumcnt_8,pnumcnt_9,pnumcnt_A,pnumcnt_B,pnumcnt_C,pnumcnt_D,pnumcnt_E,pnumcnt_F;
uint32_t pulsenub_0,pulsenub_1,pulsenub_2,pulsenub_3,pulsenub_4,pulsenub_5,pulsenub_6,pulsenub_7,pulsenub_8,pulsenub_9,pulsenub_A,pulsenub_B,pulsenub_C,pulsenub_D,pulsenub_E,pulsenub_F;

void CHn_Message_Send()
{
	CHn_state[0]= 0xcd; 			CHn_state[1]= 0xeb; 			CHn_state[2]= rd_state>>24;  CHn_state[3]= rd_state>>16; 
	CHn_state[4]= limit>>24;  CHn_state[5]= limit>>16; 	CHn_state[6]= limit>>8; 	   CHn_state[7]= limit;
	
	HAL_UART_Write_Polling(CHn_state, sizeof(CHn_state));	
}

void CH0_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_0 = 0;
	Npulse_send0 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_0 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_0 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_0=0; n_0 = (fo -fs)*10/(ms*10); }				
	else 													{	M_0=1; n_0 = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr1 +0x00000020,  1*100*1000000/fs);	//PWM0频率
	AHB_Out32(AHB_BaseAddr3 +0x00000020,  pulsenub_0);			  //PWM0脉冲数
}
void CH1_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_1 = 0;
	Npulse_send1 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_1 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_1 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_1=0; n_1 = (fo -fs)*10/(ms*10); }				
	else 													{	M_1=1; n_1 = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr1 +0x00000040,  1*100*1000000/fs);	//PWM1频率
	AHB_Out32(AHB_BaseAddr3 +0x00000040,  pulsenub_1);			  //PWM1脉冲数
}
void CH2_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_2 = 0;
	Npulse_send2 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_2 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_2 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_2=0; n_2 = (fo -fs)*10/(ms*10); }				
	else 													{	M_2=1; n_2 = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr0 +0x00000004,  1*100*1000000/fs);	//PWM2频率
	AHB_Out32(AHB_BaseAddr2 +0x00000004, pulsenub_2);			  	 //PWM2脉冲数
}
void CH3_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_3 = 0;
	Npulse_send3 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_3 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_3 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_3=0; n_3 = (fo -fs)*10/(ms*10); }				
	else 													{	M_3=1; n_3 = (fo -fs)*10*10000/(ms*10); }	
	AHB_Out32(AHB_BaseAddr0 +0x00000008,  1*100*1000000/fs);	//PWM3频率
	AHB_Out32(AHB_BaseAddr2 +0x00000008, pulsenub_3);			  	 //PWM3脉冲数
}
void CH4_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_4 = 0;
	Npulse_send4 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_4 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_4 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_4=0; n_4 = (fo -fs)*10/(ms*10); }				
	else 													{	M_4=1; n_4 = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr0 +0x00000010,  1*100*1000000/fs);	//PWM4频率
	AHB_Out32(AHB_BaseAddr2 +0x00000010, pulsenub_4);			  	 //PWM4脉冲数
}
void CH5_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_5 = 0;
	Npulse_send5 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_5 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_5 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_5=0; n_5 = (fo -fs)*10/(ms*10); }				
	else 													{	M_5=1; n_5 = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr0 +0x00000020,  1*100*1000000/fs);		//PWM5频率
	AHB_Out32(AHB_BaseAddr2 +0x00000020,  pulsenub_5);			  	 //PWM5脉冲数
}
void CH6_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_6 = 0;
	Npulse_send6 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_6 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_6 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_6=0; n_6 = (fo -fs)*10/(ms*10); }				
	else 													{	M_6=1; n_6 = (fo -fs)*10*10000/(ms*10); }	
	AHB_Out32(AHB_BaseAddr0 +0x00000040,  1*100*1000000/fs);	//PWM6频率
	AHB_Out32(AHB_BaseAddr2 +0x00000040,  pulsenub_6);			  //PWM6脉冲数
}
void CH7_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_7 = 0;
	Npulse_send7 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_7 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_7 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_7=0; n_7 = (fo -fs)*10/(ms*10); }				
	else 													{	M_7=1; n_7 = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr0 +0x00000080,  1*100*1000000/fs);	//PWM7频率
	AHB_Out32(AHB_BaseAddr2 +0x00000080,  pulsenub_7);			  //PWM7脉冲数
}
void CH8_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_8 = 0;
	Npulse_send8 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_8 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_8 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_8=0; n_8 = (fo -fs)*10/(ms*10); }				
	else 													{	M_8=1; n_8 = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr0 +0x00000100,  1*100*1000000/fs);	//PWM8频率
	AHB_Out32(AHB_BaseAddr2 +0x00000100,  pulsenub_8);			  //PWM8脉冲数
}
void CH9_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_9 = 0;
	Npulse_send9 = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_9 = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_9 = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_9=0; n_9 = (fo -fs)*10/(ms*10); }				
	else 													{	M_9=1; n_9 = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr0 +0x00000200,  1*100*1000000/fs);	//PWM9频率
	AHB_Out32(AHB_BaseAddr2 +0x00000200,  pulsenub_9);			  //PWM9脉冲数
}
void CHA_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_A = 0;
	Npulse_sendA = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_A = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_A = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_A=0; n_A = (fo -fs)*10/(ms*10); }				
	else 													{	M_A=1; n_A = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr0 +0x00000400,  1*100*1000000/fs);	//PWMA频率
	AHB_Out32(AHB_BaseAddr2 +0x00000400,  pulsenub_A);			  //PWMA脉冲数
}
void CHB_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_B = 0;
	Npulse_sendB = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_B = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_B = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_B=0; n_B = (fo -fs)*10/(ms*10); }				
	else 													{	M_B=1; n_B = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr0 +0x00000800,  1*100*1000000/fs);	//PWMB频率
	AHB_Out32(AHB_BaseAddr2 +0x00000800,  pulsenub_B);			  //PWMB脉冲数
}
void CHC_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_C = 0;
	Npulse_sendC = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_C = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_C = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_C=0; n_C = (fo -fs)*10/(ms*10); }				
	else 													{	M_C=1; n_C = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr4 +0x00000000,  1*100*1000000/fs);		//PWMC频率
	AHB_Out32(AHB_BaseAddr5 +0x00000000,  pulsenub_C);			  	//PWMC脉冲数
}
void CHD_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_D = 0;
	Npulse_sendD = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_D = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_D = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_D=0; n_D = (fo -fs)*10/(ms*10); }				
	else 													{	M_D=1; n_D = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr1 +0x00000004,  1*100*1000000/fs);	//PWMD频率
	AHB_Out32(AHB_BaseAddr3 +0x00000004,  pulsenub_D);			  //PWMD脉冲数
}
void CHE_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_E = 0;
	Npulse_sendE = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_E = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_E = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_E=0; n_E = (fo -fs)*10/(ms*10); }				
	else 													{	M_E=1; n_E = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr1 +0x00000008,  1*100*1000000/fs);	//PWME频率
	AHB_Out32(AHB_BaseAddr3 +0x00000008,  pulsenub_E);			  //PWME脉冲数
}
void CHF_Deploy(uint16_t fs,uint32_t fo,uint32_t pulsenub,uint16_t ms)
{
	pnumcnt_F = 0;
	Npulse_sendF = 0; 
	if(pulsenub > 0xFFFFFF) pulsenub_F = 0xFFFFFFFF - pulsenub +0x80000001;
	else 										pulsenub_F = pulsenub;
	if((fo -fs)/ms*10000 > 10000) {	M_F=0; n_F = (fo -fs)*10/(ms*10); }				
	else 													{	M_F=1; n_F = (fo -fs)*10*10000/(ms*10); }	
	
	AHB_Out32(AHB_BaseAddr1 +0x00000010,  1*100*1000000/fs);	//PWMF频率
	AHB_Out32(AHB_BaseAddr3 +0x00000010,  pulsenub_F);			  //PWMF脉冲数
}

void CHn_ORDER_SEND(uint8_t nh,uint8_t nl,uint8_t go)   								//串口接受命令后配置CHn同时启动CHn
{
	if ((nl&0x01)==0x01) CH0_Deploy(FS_0, FO_0, Npulse_0, Ms_0 );
	if ((nl&0x02)==0x02) CH1_Deploy(FS_1, FO_1, Npulse_1, Ms_1 );
	if ((nl&0x04)==0x04) CH2_Deploy(FS_2, FO_2, Npulse_2, Ms_2 );
	if ((nl&0x08)==0x08) CH3_Deploy(FS_3, FO_3, Npulse_3, Ms_3 );
	if ((nl&0x10)==0x10) CH4_Deploy(FS_4, FO_4, Npulse_4, Ms_4 );
	if ((nl&0x20)==0x20) CH5_Deploy(FS_5, FO_5, Npulse_5, Ms_5 );
	if ((nl&0x40)==0x40) CH6_Deploy(FS_6, FO_6, Npulse_6, Ms_6 );
	if ((nl&0x80)==0x80) CH7_Deploy(FS_7, FO_7, Npulse_7, Ms_7 );
	
	if ((nh&0x01)==0x01) CH8_Deploy(FS_8, FO_8, Npulse_8, Ms_8 );
	if ((nh&0x02)==0x02) CH9_Deploy(FS_9, FO_9, Npulse_9, Ms_9 );
	if ((nh&0x04)==0x04) CHA_Deploy(FS_A, FO_A, Npulse_A, Ms_A );
	if ((nh&0x08)==0x08) CHB_Deploy(FS_B, FO_B, Npulse_B, Ms_B );
	if ((nh&0x10)==0x10) CHC_Deploy(FS_C, FO_C, Npulse_C, Ms_C );
	if ((nh&0x20)==0x20) CHD_Deploy(FS_D, FO_D, Npulse_D, Ms_D );
	if ((nh&0x40)==0x40) CHE_Deploy(FS_E, FO_E, Npulse_E, Ms_E );
	if ((nh&0x80)==0x80) CHF_Deploy(FS_F, FO_F, Npulse_F, Ms_F );
	AHB_Out32(AHB_BaseAddr3 +0x00000080, ((nh<<8)+nl)<<16); 	//PWM启动停止命令
	Go = 0;
	state 	 = AHB_In32(AHB_BaseAddr1 +0x00000080);   		  	//传递rd_state参数
	rd_state = AHB_In32(AHB_BaseAddr1 +0x00000080); 
	while(rd_state != 0x00000000)
	{
		if(timer ==1000){timer =0; CHn_Message_Send();}
	}
}
