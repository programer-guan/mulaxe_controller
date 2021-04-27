#include "log.h"
#include "uart.h"
#include "intc.h"
#include "timer.h"
#include "syscon.h"
#include "platform.h"
#include "uart_demo.h"
#include "timer_demo.h"
#include "pulse_demo.h"
#include "int_register.h"
 
uint32_t n_0,n_1,n_2,n_3,n_4,n_5,n_6,n_7,n_8,n_9,n_A,n_B,n_C,n_D,n_E,n_F;
uint32_t timer,limit;
uint32_t u_0,u_1,u_2,u_3,u_4,u_5,u_6,u_7,u_8,u_9,u_A,u_B,u_C,u_D,u_E,u_F;
uint32_t Npulse_send0,Npulse_send1,Npulse_send2,Npulse_send3,Npulse_send4,Npulse_send5,Npulse_send6,Npulse_send7,Npulse_send8,Npulse_send9,Npulse_sendA,Npulse_sendB,Npulse_sendC,Npulse_sendD,Npulse_sendE,Npulse_sendF;

void timer_isr(void *param)
{
	timer++;
	state 	 = AHB_In32(AHB_BaseAddr1 +0x00000080);   	//����rd_state����
	rd_state = AHB_In32(AHB_BaseAddr1 +0x00000080);  	
	limit = AHB_In32(AHB_BaseAddr1 +0x00000200);   			//����limit����
	limit = AHB_In32(AHB_BaseAddr1 +0x00000200);  	
	if ((NL&0x01)==0x01) CH0_OPREA();
	if ((NL&0x02)==0x02) CH1_OPREA();
	if ((NL&0x04)==0x04) CH2_OPREA(); 
	if ((NL&0x08)==0x08) CH3_OPREA();
	if ((NL&0x10)==0x10) CH4_OPREA();
	if ((NL&0x20)==0x20) CH5_OPREA();
	if ((NL&0x40)==0x40) CH6_OPREA(); 
	if ((NL&0x80)==0x80) CH7_OPREA();
	
	if ((NH&0x01)==0x01) CH8_OPREA();
	if ((NH&0x02)==0x02) CH9_OPREA();
	if ((NH&0x04)==0x04) CHA_OPREA(); 
	if ((NH&0x08)==0x08) CHB_OPREA();
  if ((NH&0x10)==0x10) CHC_OPREA();
	if ((NH&0x20)==0x20) CHD_OPREA();
	if ((NH&0x40)==0x40) CHE_OPREA(); 
	if ((NH&0x80)==0x80) CHF_OPREA();
	HAL_TIMER_Int_Clr(TIMER1);   //���ָ����ʱ������1���жϱ�־
}

static uint8_t parameter = 0xaa;
void TIMER_INIT(void)
{
	//configure the config 
	TIMER_InitTypeDef config;
	config.index = TIMER1;
	config.mask = TIMER_NOT_MASKED;
	config.mode = TIMER_PERIODIC;
	config.timer_clk = APB_CLK0/8;
	
	TIMER_Int_Register(timer_isr, &parameter);						//���ö�ʱ�����жϴ�����
	HAL_TIMER_Init(APB_CLK0, config);											//ͨ���ṹ��Ĳ�����ʼ����ʱ������
	HAL_TIMER_Set_LoadCount(TIMER1,APB_CLK0/80000);        //set counter to APB_CLK0/8000, it will trigger the interrupt once every 1/10000 second
																												//�趨��ʱ�������ļ�����ֵ��λ��
	HAL_TIMER_Enable(TIMER1,TIMER_ENABLE);								//ʹ�ܶ�ʱ������
}

void  CH0_OPREA()
{
	pnumcnt_0 = AHB_In32(AHB_BaseAddr0 +0x00000004); 			//����PWM0ʣ����������
	pnumcnt_0 = AHB_In32(AHB_BaseAddr0 +0x00000004); 	
	pulsenub_0 = pulsenub_0 & 0xFFFFFF;	
	if(pnumcnt_0 < Npulse_send0)
	{
		if (u_0 >  0) u_0--; 
		if (M_0 ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000020, 1*100*100*(1000000000/(u_0*n_0+FS_0*100000)));	//PWM0Ƶ��
		else			    AHB_Out32(AHB_BaseAddr1 +0x00000020, 1*100*10000000/(u_0*n_0+FS_0*10));	//PWM0Ƶ��
	}
	else if(I_0 < (Ms_0*10) )
	{
		I_0++; 
		if (M_0 ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000020, 1*100*100*(1000000000/(u_0*n_0+FS_0*100000)));	//PWM0Ƶ��
		else				  AHB_Out32(AHB_BaseAddr1 +0x00000020, 1*100*10000000/(I_0*n_0+FS_0*10));	//PWM0Ƶ��
		Npulse_send0 = pulsenub_0- pnumcnt_0;
		u_0 = I_0;
	}
	else if(I_0 == (Ms_0*10))
	{ 
		I_0++;
		Npulse_send0 = pulsenub_0 - pnumcnt_0;
		AHB_Out32(AHB_BaseAddr1 +0x00000020, 1*100*1000000/FO_0);		  					//PWM0Ƶ��
//	  printf("Npulse_send0 = %d pnumcnt_0=%d n_0=%d\r\n",Npulse_send0,pnumcnt_0,n_0);
	}
}
void  CH1_OPREA()
{
	pnumcnt_1 = AHB_In32(AHB_BaseAddr0 +0x00000008); 			//����PWM1ʣ����������
	pnumcnt_1 = AHB_In32(AHB_BaseAddr0 +0x00000008); 	
	pulsenub_1 = pulsenub_1 & 0xFFFFFF;	
	if(pnumcnt_1 < Npulse_send1)
	{
		if (u_1 >  0) u_1--; 
		if (M_1 ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000040, 1*100*100*(1000000000/(u_1*n_1+FS_1*100000)));	//PWM1Ƶ��
		else					AHB_Out32(AHB_BaseAddr1 +0x00000040, 1*100*10000000/(u_1*n_1+FS_1*10));	//PWM1Ƶ��
	}
	else if(I_1 < (Ms_1*10) )
	{
		I_1++; 
		if (M_1 ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000040, 1*100*100*(1000000000/(u_1*n_1+FS_1*100000)));	//PWM1Ƶ��
		else					AHB_Out32(AHB_BaseAddr1 +0x00000040, 1*100*10000000/(I_1*n_1+FS_1*10));	//PWM1Ƶ��
		Npulse_send1 = pulsenub_1- pnumcnt_1;
		u_1 = I_1;
	}
	else if(I_1 == (Ms_1*10))
	{ 
		I_1++;
		Npulse_send1 = pulsenub_1 - pnumcnt_1;
		AHB_Out32(AHB_BaseAddr1 +0x00000040, 1*100*1000000/FO_1);		  					//PWM1Ƶ��
//	  printf("Npulse_send1 = %d pnumcnt_1=%d n_1=%d\r\n",Npulse_send1,pnumcnt_1,n_1);
	}
}
void  CH2_OPREA()
{
	pnumcnt_2 = AHB_In32(AHB_BaseAddr0 +0x00000010); 			//����PWM2ʣ����������
	pnumcnt_2 = AHB_In32(AHB_BaseAddr0 +0x00000010); 	
	pulsenub_2 = pulsenub_2 & 0xFFFFFF;	
	if(pnumcnt_2 < Npulse_send2)		
	{
		if (u_2 >  0) u_2--; 
		if (M_2 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000004, 1*100*100*(1000000000/(u_2*n_2+FS_2*100000)));	//PWM2Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000004, 1*100*10000000/(u_2*n_2+FS_2*10));	//PWM2Ƶ��
	}
	else if(I_2 < (Ms_2*10) )
	{
		I_2++; 
		if (M_2 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000004, 1*100*100*(1000000000/(u_2*n_2+FS_2*100000)));	//PWM2Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000004, 1*100*10000000/(I_2*n_2+FS_2*10));	//PWM2Ƶ��
		Npulse_send2 = pulsenub_2 - pnumcnt_2;
		u_2 = I_2;
	}
	else if(I_2 == (Ms_2*10))
	{ 
		I_2++;
		Npulse_send2 = pulsenub_2 - pnumcnt_2;
		AHB_Out32(AHB_BaseAddr0 +0x00000004, 1*100*1000000/FO_2);		  					//PWM2Ƶ��
//  	printf("Npulse_send2 = %d pnumcnt_2=%d n_2=%d\r\n",Npulse_send2,pnumcnt_2,n_2);
	}
}
void  CH3_OPREA()
{
	pnumcnt_3 = AHB_In32(AHB_BaseAddr0 +0x00000020); 			//����PWM3ʣ����������	
	pnumcnt_3 = AHB_In32(AHB_BaseAddr0 +0x00000020); 	
	pulsenub_3 = pulsenub_3 & 0xFFFFFF;	
	if(pnumcnt_3 < Npulse_send3)		
	{
		if (u_3 >  0) u_3--; 
		if (M_3 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000008, 1*100*100*(1000000000/(u_3*n_3+FS_3*100000)));	//PWM3Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000008, 1*100*10000000/(u_3*n_3+FS_3*10));	//PWM3Ƶ��
	}
	else if(I_3< (Ms_3*10) )
	{
		I_3++; 
		if (M_3 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000008, 1*100*100*(1000000000/(u_3*n_3+FS_3*100000)));	//PWM3Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000008, 1*100*10000000/(I_3*n_3+FS_3*10));	//PWM3Ƶ��
		Npulse_send3 = pulsenub_3 - pnumcnt_3;
		u_3 = I_3;
	}
	else if(I_3 == (Ms_3*10))
	{ 
		I_3++;
		Npulse_send3 = pulsenub_3 - pnumcnt_3;
		AHB_Out32(AHB_BaseAddr0 +0x00000008, 1*100*1000000/FO_3);		  					//PWM3Ƶ��
//  	printf("Npulse_send3 = %d pnumcnt_3=%d n_3=%d\r\n",Npulse_send3,pnumcnt_3,n_3);
	}
}
void  CH4_OPREA()
{
	pnumcnt_4 = AHB_In32(AHB_BaseAddr0 +0x00000040); 			//����PWM4ʣ����������
	pnumcnt_4 = AHB_In32(AHB_BaseAddr0 +0x00000040); 
	pulsenub_4 = pulsenub_4 & 0xFFFFFF;	
	if(pnumcnt_4 < Npulse_send4)		
	{
		if (u_4 >  0) u_4--; 
		if (M_4 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000010, 1*100*100*(1000000000/(u_4*n_4+FS_4*100000)));	//PWM4Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000010, 1*100*10000000/(u_4*n_4+FS_4*10));	//PWM4Ƶ��
	}
	else if(I_4< (Ms_4*10) )
	{
		I_4++; 
		if (M_4 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000010, 1*100*100*(1000000000/(u_4*n_4+FS_4*100000)));	//PWM4Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000010, 1*100*10000000/(I_4*n_4+FS_4*10));	//PWM4Ƶ��
		Npulse_send4 = pulsenub_4 - pnumcnt_4;
		u_4 = I_4;
	}
	else if(I_4 == (Ms_4*10))
	{ 
		I_4++;
		Npulse_send4 = pulsenub_4 - pnumcnt_4;
		AHB_Out32(AHB_BaseAddr0 +0x00000010, 1*100*1000000/FO_4);		  					//PWM4Ƶ��
//		printf("Npulse_send4 = %d pnumcnt_4=%d n_4=%d\r\n",Npulse_send4,pnumcnt_4,n_4);
	}
}
void  CH5_OPREA()
{
	pnumcnt_5 = AHB_In32(AHB_BaseAddr0 +0x00000080); 			//����PWM5ʣ����������
	pnumcnt_5 = AHB_In32(AHB_BaseAddr0 +0x00000080); 
	pulsenub_5 = pulsenub_5 & 0xFFFFFF;	
	if(pnumcnt_5 < Npulse_send5)		
	{
		if (u_5 >  0) u_5--; 
		if (M_5 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000020, 1*100*100*(1000000000/(u_5*n_5+FS_5*100000)));	//PWM5Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000020, 1*100*10000000/(u_5*n_5+FS_5*10));	//PWM5Ƶ��
	}
	else if(I_5< (Ms_5*10) )
	{
		I_5++; 
		if (M_5 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000020, 1*100*100*(1000000000/(u_5*n_5+FS_5*100000)));	//PWM5Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000020, 1*100*10000000/(I_5*n_5+FS_5*10));	//PWM5Ƶ��
		Npulse_send5 = pulsenub_5 - pnumcnt_5;
		u_5 = I_5;
	}
	else if(I_5 == (Ms_5*10))
	{ 
		I_5++;
		Npulse_send5 = pulsenub_5 - pnumcnt_5;
		AHB_Out32(AHB_BaseAddr0 +0x00000020, 1*100*1000000/FO_5);		  					//PWM5Ƶ��
//		printf("Npulse_send5 = %d pnumcnt_5=%d n_5=%d\r\n",Npulse_send5,pnumcnt_5,n_5);
	}
}
void  CH6_OPREA()
{
	pnumcnt_6 = AHB_In32(AHB_BaseAddr0 +0x00000100); 			//����PWM6ʣ����������
	pnumcnt_6 = AHB_In32(AHB_BaseAddr0 +0x00000100); 
	pulsenub_6 = pulsenub_6 & 0xFFFFFF;	
	if(pnumcnt_6 < Npulse_send6)		
	{
		if (u_6 >  0) u_6--; 
		if (M_6 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000040, 1*100*100*(1000000000/(u_6*n_6+FS_6*100000)));	//PWM6Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000040, 1*100*10000000/(u_6*n_6+FS_6*10));	//PWM6Ƶ��
	}
	else if(I_6< (Ms_6*10) )
	{
		I_6++; 
		if (M_6 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000040, 1*100*100*(1000000000/(u_6*n_6+FS_6*100000)));	//PWM6Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000040, 1*100*10000000/(I_6*n_6+FS_6*10));	//PWM6Ƶ��
		Npulse_send6 = pulsenub_6 - pnumcnt_6;
		u_6 = I_6;
	}
	else if(I_6 == (Ms_6*10))
	{ 
		I_6++;
		Npulse_send6 = pulsenub_6 - pnumcnt_6;
		AHB_Out32(AHB_BaseAddr0 +0x00000040, 1*100*1000000/FO_6);		  					//PWM6Ƶ��
//		printf("Npulse_send6 = %d pnumcnt_6=%d n_6=%d\r\n",Npulse_send6,pnumcnt_6,n_6);
	}
}
void  CH7_OPREA()
{
	pnumcnt_7 = AHB_In32(AHB_BaseAddr0 +0x00000200); 			//����PWM7ʣ����������
	pnumcnt_7 = AHB_In32(AHB_BaseAddr0 +0x00000200); 		
	pulsenub_7 = pulsenub_7 & 0xFFFFFF;	
	if(pnumcnt_7 < Npulse_send7)		
	{
		if (u_7 >  0) u_7--; 
		if (M_7 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000080, 1*100*100*(1000000000/(u_7*n_7+FS_7*100000)));	//PWM7Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000080, 1*100*10000000/(u_7*n_7+FS_7*10));	//PWM7Ƶ��
	}
	else if(I_7< (Ms_7*10) )
	{
		I_7++; 
		if (M_7 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000080, 1*100*100*(1000000000/(u_7*n_7+FS_7*100000)));	//PWM7Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000080, 1*100*10000000/(I_7*n_7+FS_7*10));	//PWM7Ƶ��
		Npulse_send7 = pulsenub_7 - pnumcnt_7;
		u_7 = I_7;
	}
	else if(I_7 == (Ms_7*10))
	{ 
		I_7++;
		Npulse_send5 = pulsenub_7 - pnumcnt_7;
		AHB_Out32(AHB_BaseAddr0 +0x00000080, 1*100*1000000/FO_7);		  					//PWM7Ƶ��
//		printf("Npulse_send7 = %d pnumcnt_7=%d n_7=%d\r\n",Npulse_send7,pnumcnt_7,n_7);
	}
}
void  CH8_OPREA()
{
	pnumcnt_8 = AHB_In32(AHB_BaseAddr0 +0x00000400); 			//����PWM8ʣ����������
	pnumcnt_8 = AHB_In32(AHB_BaseAddr0 +0x00000400); 	
	pulsenub_8 = pulsenub_8 & 0xFFFFFF;		
	if(pnumcnt_8 < Npulse_send8)		
	{
		if (u_8 >  0) u_8--; 
		if (M_8 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000100, 1*100*100*(1000000000/(u_8*n_8+FS_8*100000)));	//PWM8Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000100, 1*100*10000000/(u_8*n_8+FS_8*10));	//PWM8Ƶ��
	}
	else if(I_8< (Ms_8*10) )
	{
		I_8++; 
		if (M_8 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000100, 1*100*100*(1000000000/(u_8*n_8+FS_8*100000)));	//PWM8Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000100, 1*100*10000000/(I_8*n_8+FS_8*10));	//PWM8Ƶ��
		Npulse_send8 = pulsenub_8 - pnumcnt_8;
		u_8 = I_8;
	}
	else if(I_8 == (Ms_8*10))
	{ 
		I_8++;
		Npulse_send8 = pulsenub_8 - pnumcnt_8;
		AHB_Out32(AHB_BaseAddr0 +0x00000100, 1*100*1000000/FO_8);		  					//PWM8Ƶ��
//		printf("Npulse_send8 = %d pnumcnt_8=%d n_8=%d\r\n",Npulse_send8,pnumcnt_8,n_8);
	}
}
void  CH9_OPREA()
{
	pnumcnt_9 = AHB_In32(AHB_BaseAddr0 +0x00000800); 			//����PWM9ʣ����������
	pnumcnt_9 = AHB_In32(AHB_BaseAddr0 +0x00000800); 		
 	pulsenub_9 = pulsenub_9 & 0xFFFFFF;	
	if(pnumcnt_9 < Npulse_send9)		
	{
		if (u_9 >  0) u_9--; 
		if (M_9 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000200, 1*100*100*(1000000000/(u_9*n_9+FS_9*100000)));	//PWM9Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000200, 1*100*10000000/(u_9*n_9+FS_9*10));	//PWM9Ƶ��
	}
	else if(I_9< (Ms_9*10) )
	{
		I_9++; 
		if (M_9 ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000200, 1*100*100*(1000000000/(u_9*n_9+FS_9*100000)));	//PWM9Ƶ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000200, 1*100*10000000/(I_9*n_9+FS_9*10));	//PWM9Ƶ��
		Npulse_send9 = pulsenub_9 - pnumcnt_9;
		u_9 = I_9;
	}
	else if(I_9 == (Ms_9*10))
	{ 
		I_9++;
		Npulse_send9 = pulsenub_9 - pnumcnt_9;
		AHB_Out32(AHB_BaseAddr0 +0x00000200, 1*100*1000000/FO_9);		  					//PWM9Ƶ��
//		printf("Npulse_send9 = %d pnumcnt_9=%d n_9=%d\r\n",Npulse_send9,pnumcnt_9,n_9);
	}
}
void  CHA_OPREA()
{
	pnumcnt_A = AHB_In32(AHB_BaseAddr4 +0x00000000); 			//����PWMAʣ����������
	pnumcnt_A = AHB_In32(AHB_BaseAddr4 +0x00000000); 	
	pulsenub_A = pulsenub_A & 0xFFFFFF;	
	if(pnumcnt_A < Npulse_sendA)		
	{
		if (u_A >  0) u_A--; 
		if (M_A ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000400, 1*100*100*(1000000000/(u_A*n_A+FS_A*100000)));	//PWMAƵ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000400, 1*100*10000000/(u_A*n_A+FS_A*10));	//PWMAƵ��
	}
	else if(I_A< (Ms_A*10) )
	{
		I_A++; 
		if (M_A ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000400, 1*100*100*(1000000000/(u_A*n_A+FS_A*100000)));	//PWMAƵ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000400, 1*100*10000000/(I_A*n_A+FS_A*10));	//PWMAƵ��
		Npulse_sendA = pulsenub_A - pnumcnt_A;
		u_A = I_A;
	}
	else if(I_A == (Ms_A*10))
	{ 
		I_A++;
		Npulse_sendA = pulsenub_A - pnumcnt_A;
		AHB_Out32(AHB_BaseAddr0 +0x00000400, 1*100*1000000/FO_A);		  					//PWMAƵ��
//		printf("Npulse_sendA = %d pnumcnt_A=%d n_A=%d\r\n",Npulse_sendA,pnumcnt_A,n_A);
	}
}
void  CHB_OPREA()
{
	pnumcnt_B = AHB_In32(AHB_BaseAddr1 +0x00000004); 			//����PWMBʣ����������
	pnumcnt_B = AHB_In32(AHB_BaseAddr1 +0x00000004); 	
 	pulsenub_B = pulsenub_B & 0xFFFFFF;	
	if(pnumcnt_B < Npulse_sendB)		
	{
		if (u_B >  0) u_B--; 
		if (M_B ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000800, 1*100*100*(1000000000/(u_B*n_B+FS_B*100000)));	//PWMBƵ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000800, 1*100*10000000/(u_B*n_B+FS_B*10));	//PWMBƵ��
	}
	else if(I_B< (Ms_B*10) )
	{
		I_B++; 
		if (M_B ==1 ) AHB_Out32(AHB_BaseAddr0 +0x00000800, 1*100*100*(1000000000/(u_B*n_B+FS_B*100000)));	//PWMBƵ��
		else					AHB_Out32(AHB_BaseAddr0 +0x00000800, 1*100*10000000/(I_B*n_B+FS_B*10));	//PWMBƵ��
		Npulse_sendB = pulsenub_B - pnumcnt_B;
		u_B = I_B;
	}
	else if(I_B == (Ms_B*10))
	{ 
		I_B++;
		Npulse_sendB = pulsenub_B - pnumcnt_B;
		AHB_Out32(AHB_BaseAddr0 +0x00000800, 1*100*1000000/FO_B);		  					//PWMBƵ��
//		printf("Npulse_sendB = %d pnumcnt_B=%d n_B=%d\r\n",Npulse_sendB,pnumcnt_B,n_B);
	}
}
void  CHC_OPREA()
{
	pnumcnt_C = AHB_In32(AHB_BaseAddr1 +0x00000008); 			//����PWMCʣ����������
	pnumcnt_C = AHB_In32(AHB_BaseAddr1 +0x00000008); 	
	pulsenub_C = pulsenub_C & 0xFFFFFF;	
	if(pnumcnt_C < Npulse_sendC)		
	{
		if (u_C >  0) u_C--; 
		if (M_C ==1 ) AHB_Out32(AHB_BaseAddr4 +0x00000000, 1*100*100*(1000000000/(u_C*n_C+FS_C*100000)));	//PWMCƵ��
		else					AHB_Out32(AHB_BaseAddr4 +0x00000000, 1*100*10000000/(u_C*n_C+FS_C*10));	//PWMCƵ��
	}
	else if(I_C< (Ms_C*10) )
	{
		I_C++; 
		if (M_C ==1 ) AHB_Out32(AHB_BaseAddr4 +0x00000000, 1*100*100*(1000000000/(u_C*n_C+FS_C*100000)));	//PWMCƵ��
		else					AHB_Out32(AHB_BaseAddr4 +0x00000000, 1*100*10000000/(I_C*n_C+FS_C*10));	//PWMCƵ��
		Npulse_sendC = pulsenub_C - pnumcnt_C;
		u_C = I_C;
	}
	else if(I_C == (Ms_C*10))
	{ 
		I_C++;
		Npulse_sendC = pulsenub_C - pnumcnt_C;
		AHB_Out32(AHB_BaseAddr4 +0x00000000, 1*100*1000000/FO_C);		  					//PWMCƵ��
//		printf("Npulse_sendC = %d pnumcnt_C=%d n_C=%d\r\n",Npulse_sendC,pnumcnt_C,n_C);
	}
}

void  CHD_OPREA()
{
	pnumcnt_D = AHB_In32(AHB_BaseAddr1 +0x00000010); 			//����PWMDʣ����������
	pnumcnt_D = AHB_In32(AHB_BaseAddr1 +0x00000010); 
 	pulsenub_D = pulsenub_D & 0xFFFFFF;	
	if(pnumcnt_D < Npulse_send8)		
	{
		if (u_D >  0) u_D--; 
		if (M_D ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000004, 1*100*100*(1000000000/(u_D*n_D+FS_D*100000)));	//PWMDƵ��
		else					AHB_Out32(AHB_BaseAddr1 +0x00000004, 1*100*10000000/(u_D*n_D+FS_D*10));	//PWMDƵ��
	}
	else if(I_D< (Ms_D*10) )
	{
		I_D++; 
		if (M_D ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000004, 1*100*100*(1000000000/(u_D*n_D+FS_D*100000)));	//PWMDƵ��
		else					AHB_Out32(AHB_BaseAddr1 +0x00000004, 1*100*10000000/(I_D*n_D+FS_D*10));	//PWMDƵ��
		Npulse_sendD = pulsenub_D - pnumcnt_D;
		u_D = I_D;
	}
	else if(I_D == (Ms_D*10))
	{ 
		I_D++;
		Npulse_sendD = pulsenub_D - pnumcnt_D;
		AHB_Out32(AHB_BaseAddr1 +0x00000004, 1*100*1000000/FO_D);		  					//PWMDƵ��
//		printf("Npulse_sendD = %d pnumcnt_D=%d n_D=%d\r\n",Npulse_sendD,pnumcnt_D,n_D);
	}
}
void  CHE_OPREA()
{
	pnumcnt_E = AHB_In32(AHB_BaseAddr1 +0x00000020); 			//����PWMEʣ����������
	pnumcnt_E = AHB_In32(AHB_BaseAddr1 +0x00000020); 		
	pulsenub_E = pulsenub_E & 0xFFFFFF;	
	if(pnumcnt_E < Npulse_send8)		
	{
		if (u_E >  0) u_E--; 
		if (M_E ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000008, 1*100*100*(1000000000/(u_E*n_E+FS_E*100000)));	//PWMEƵ��
		else					AHB_Out32(AHB_BaseAddr1 +0x00000008, 1*100*10000000/(u_E*n_E+FS_E*10));	//PWMEƵ��
	}
	else if(I_E< (Ms_E*10) )
	{
		I_E++; 
		if (M_E ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000008, 1*100*100*(1000000000/(u_E*n_E+FS_E*100000)));	//PWMEƵ��
		else					AHB_Out32(AHB_BaseAddr1 +0x00000008, 1*100*10000000/(I_E*n_E+FS_E*10));	//PWMEƵ��
		Npulse_sendE = pulsenub_E - pnumcnt_E;
		u_E = I_E;
	}
	else if(I_E == (Ms_E*10))
	{ 
		I_E++;
		Npulse_sendE = pulsenub_E - pnumcnt_E;
		AHB_Out32(AHB_BaseAddr1 +0x00000008, 1*100*1000000/FO_E);		  					//PWMEƵ��
//		printf("Npulse_sendE = %d pnumcnt_E=%d n_E=%d\r\n",Npulse_sendE,pnumcnt_E,n_E);
	}
}
void  CHF_OPREA()
{
	pnumcnt_F = AHB_In32(AHB_BaseAddr1 +0x00000040); 												//����PWMFʣ����������
	pnumcnt_F = AHB_In32(AHB_BaseAddr1 +0x00000040); 		
  pulsenub_F = pulsenub_F & 0xFFFFFF;	
	if(pnumcnt_F < Npulse_send8)		
	{
		if (u_F >  0) u_F--; 
		if (M_F ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000010, 1*100*100*(1000000000/(u_F*n_F+FS_F*100000)));	//PWMFƵ��
		else					AHB_Out32(AHB_BaseAddr1 +0x00000010, 1*100*10000000/(u_F*n_F+FS_F*10));	//PWMFƵ��
	}
	else if(I_F< (Ms_F*10) )
	{
		I_F++; 
		if (M_F ==1 ) AHB_Out32(AHB_BaseAddr1 +0x00000010, 1*100*100*(1000000000/(u_F*n_F+FS_F*100000)));	//PWMFƵ��
		else					AHB_Out32(AHB_BaseAddr1 +0x00000010, 1*100*10000000/(I_F*n_F+FS_F*10));	//PWMFƵ��
		Npulse_sendF = pulsenub_F - pnumcnt_F;
		u_F = I_F;
	}
	else if(I_F == (Ms_F*10))
	{ 
		I_F++;
		Npulse_sendF = pulsenub_F - pnumcnt_F;
		AHB_Out32(AHB_BaseAddr1 +0x00000010, 1*100*1000000/FO_F);		  					//PWMFƵ��
//		printf("Npulse_sendF = %d pnumcnt_F=%d n_F=%d\r\n",Npulse_sendF,pnumcnt_F,n_F);
	}
}


