#include "stdio.h"
#include "elf2.h"
#include <string.h>
#include "uart_demo.h"
#include "syscon.h"
#include "debug.h"
#include "int_register.h"
#include "intc.h"

struct param_t
{
	uint8_t p1;
	void * p2;	
};
uint8_t str[14] = {'E','L','F','2',' ','B','O','O','T',' ','O','K',0x0d,0x0a};
uint8_t send_end[2]={0x0d,0x0a};

uint8_t  NH,NL,Go,CHn,Order;

uint16_t FS_0=1000,FS_1=1000,FS_2=1000,FS_3=1000,FS_4=1000,FS_5=1000,FS_6=1000,FS_7=1000,FS_8=1000,FS_9=1000,FS_A=1000,FS_B=1000,FS_C=1000,FS_D=1000,FS_E=1000,FS_F=1000;
uint16_t Ms_0= 255,Ms_1= 255,Ms_2= 255,Ms_3= 255,Ms_4= 255,Ms_5= 255,Ms_6= 255,Ms_7= 255,Ms_8= 255,Ms_9= 255,Ms_A= 255,Ms_B= 255,Ms_C= 255,Ms_D= 255,Ms_E= 255,Ms_F= 255;
uint32_t FO_0=3000,FO_1=3000,FO_2=3000,FO_3=3000,FO_4=3000,FO_5=3000,FO_6=3000,FO_7=3000,FO_8=3000,FO_9=3000,FO_A=3000,FO_B=3000,FO_C=3000,FO_D=3000,FO_E=3000,FO_F=3000;
uint32_t Npulse_0=1000,Npulse_1=1000,Npulse_2=1000,Npulse_3=1000,Npulse_4=1000,Npulse_5=1000,Npulse_6=1000,Npulse_7=1000,Npulse_8=1000,Npulse_9=1000,Npulse_A=1000,Npulse_B=1000,Npulse_C=1000,Npulse_D=1000,Npulse_E=1000,Npulse_F=1000;

uint8_t anlogic0[] = {'W','e','l','c','o','m','e',' ','t','o',' ','u','s','e',' ','A','n','l','o','g','i','c',' ','M','C','U',' ','D','e','m','o'};
uint8_t anlogic01[] = {"\n\r---------------------------------------------\n\r"};
uint8_t anlogic02[] = {"-Welcome to use Anlogic MCU Demo             \n\r"};
uint8_t anlogic03[] = {"-Hardware ver.: V1.0                         \n\r"};
uint8_t anlogic04[] = {"-Software ver.: V1.0                         \n\r"};
uint8_t anlogic05[] = {"-Update       : April 12,2018                \n\r"};
uint8_t anlogic06[] = {"-Please select the number to test function   \n\r"};
uint8_t anlogic1[]  = {"1: Test GPIO\n\r"};
uint8_t anlogic2[]  = {"2: Test Timer\n\r"};
uint8_t anlogic3[]  = {"3: Test RTC\n\r"};
uint8_t anlogic4[]  = {"4: Test DMA\n\r"};
uint8_t anlogic5[]  = {"5: Test EXTI\n\r"};
uint8_t anlogic6[]  = {"6: Test SPI\n\r"}; 
uint8_t anlogic7[]  = {"7: Test I2C\n\r"};
uint8_t anlogic8[]  = {"8: Test I2S\n\r"};
uint8_t anlogic9[]  = {"9: Test WDT\n\r"};
uint8_t anlogicA[]  = {"A: Test ADC\n\r"};                         
 
struct param_t param;


void test_uart_finish(void *param, uint8_t status)
{
	if(status == STATUS_OK)
		;
	else
		assert_param(0);
}

void Test_Gpio(void)
{
	uint8_t example_begin[]={"Test the GPIO begin...\n\r"};
	uint8_t example_end[]={"Test the GPIO end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_Timer(void)
{
	uint8_t example_begin[]={"Test the Timer begin...\n\r"};
	uint8_t example_end[]={"Test the Timer end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_RTC(void)
{
	uint8_t example_begin[]={"Test the RTC begin...\n\r"};
	uint8_t example_end[]={"Test the RTC end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_DMA(void)
{
	uint8_t example_begin[]={"Test the DMA begin...\n\r"};
	uint8_t example_end[]={"Test the DMA end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_EXTI(void)
{
	uint8_t example_begin[]={"Test the EXTI begin...\n\r"};
	uint8_t example_end[]={"Test the EXTI end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_SPI(void)
{
	uint8_t example_begin[]={"Test the SPI begin...\n\r"};
	uint8_t example_end[]={"Test the SPI end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_I2C(void)
{
	uint8_t example_begin[]={"Test the I2C begin...\n\r"};
	uint8_t example_end[]={"Test the I2C end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_I2S(void)
{
	uint8_t example_begin[]={"Test the I2S begin...\n\r"};
	uint8_t example_end[]={"Test the I2S end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_WDT(void)
{
	uint8_t example_begin[]={"Test the WDT begin...\n\r"};
	uint8_t example_end[]={"Test the WDT end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_ADC(void)
{
	uint8_t example_begin[]={"Test the ADC begin...\n\r"};
	uint8_t example_end[]={"Test the ADC end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Tips_Input(void)
{
}

void test_uart_rx_finish(void *param, uint8_t status)
{
	if(status == STATUS_OK)
	{
		 
	HAL_UART_Write_Polling(read_buf, 1);
	HAL_UART_Write_Polling(send_end, sizeof(send_end));
		switch (read_buf[0])
		{
		case '1': Test_Gpio() ;break;
		case '2': Test_Timer();break;  
		case '3': Test_RTC()  ;break;  
		case '4': Test_DMA()  ;break;  
		case '5': Test_EXTI() ;break;  
		case '6': Test_SPI()  ;break;  
		case '7': Test_I2C()  ;break;  
		case '8': Test_I2S()  ;break;  
		case '9': Test_WDT()  ;break;  
		case 'A': Test_ADC()  ;break;  
		default : Tips_Input();break;
 	}
				
		HAL_UART_Write_Polling(anlogic01, sizeof(anlogic01));     
		HAL_UART_Write_Polling(anlogic02, sizeof(anlogic02));   
		HAL_UART_Write_Polling(anlogic03, sizeof(anlogic03));   
		HAL_UART_Write_Polling(anlogic04, sizeof(anlogic04));   
		HAL_UART_Write_Polling(anlogic05, sizeof(anlogic05)); 
		HAL_UART_Write_Polling(anlogic06, sizeof(anlogic06));   

		HAL_UART_Write_Polling(anlogic1, sizeof(anlogic1)); 
		HAL_UART_Write_Polling(anlogic2, sizeof(anlogic2)); 
		HAL_UART_Write_Polling(anlogic3, sizeof(anlogic3)); 
		HAL_UART_Write_Polling(anlogic4, sizeof(anlogic4)); 
		HAL_UART_Write_Polling(anlogic5, sizeof(anlogic5)); 
		HAL_UART_Write_Polling(anlogic6, sizeof(anlogic6)); 
		HAL_UART_Write_Polling(anlogic7, sizeof(anlogic7)); 
		HAL_UART_Write_Polling(anlogic8, sizeof(anlogic8)); 
		HAL_UART_Write_Polling(anlogic9, sizeof(anlogic9)); 
		HAL_UART_Write_Polling(anlogicA, sizeof(anlogicA)); 
		HAL_UART_Write_Polling(anlogic01, sizeof(anlogic01)); 
					
		memset(read_buf,0,1);
	}
	else
		assert_param(0);
}
void uart_rx_finish(void *param, uint8_t status)
{ 
	if(status == STATUS_OK)
	{	 

		Order = parameter_buf[0];
		CHn   = parameter_buf[1];
		switch (Order)
		{
			case 0xcd:
					{ 
						if(CHn == 0x00)
						{
							FS_0     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_0     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_0 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_0     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//							printf("FS_0 = %d FO_0=%d Npulse_0=%d Ms_0=%d\r\n",FS_0,FO_0,Npulse_0,Ms_0);

						}
						if(CHn == 0x01)
						{
							FS_1     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_1     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_1 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_1     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//							printf("FS_1 = %d FO_1=%d Npulse_1=%d Ms_1=%d\r\n",FS_1,FO_1,Npulse_1,Ms_1);
						}
						if(CHn == 0x02)
						{
							FS_2     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_2     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_2 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_2     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//				     printf("FS_2 = %d FO_2=%d Npulse_2=%d Ms_2=%d\r\n",FS_2,FO_2,Npulse_2,Ms_2);
						}
						if(CHn == 0x03)
						{
							FS_3     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_3     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_3 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_3     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//				 		  printf("FS_3 = %d FO_3=%d Npulse_3=%d Ms_3=%d\r\n",FS_3,FO_3,Npulse_3,Ms_3);
						}
						if(CHn == 0x04)
						{
							FS_4     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_4     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_4 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_4     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//				  		printf("FS_4 = %d FO_4=%d Npulse_4=%d Ms_4=%d\r\n",FS_4,FO_4,Npulse_4,Ms_4);
						}
						if(CHn == 0x05)
						{
							FS_5     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_5     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_5 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_5     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//				  		printf("FS_5 = %d FO_5=%d Npulse_5=%d Ms_5=%d\r\n",FS_5,FO_5,Npulse_5,Ms_5);
						}
						if(CHn == 0x06)
						{
							FS_6     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_6     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_6 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_6     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//				  		printf("FS_6 = %d FO_6=%d Npulse_6=%d Ms_6=%d\r\n",FS_6,FO_6,Npulse_6,Ms_6);
						}
						if(CHn == 0x07)
						{
							FS_7     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_7     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_7 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_7     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//							printf("FS_7 = %d FO_7=%d Npulse_7=%d Ms_7=%d\r\n",FS_7,FO_7,Npulse_7,Ms_7);
						}
						if(CHn == 0x08)
						{
							FS_8     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_8     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_8 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_8     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//			 		    printf("FS_8 = %d FO_8=%d Npulse_8=%d Ms_8=%d\r\n",FS_8,FO_8,Npulse_8,Ms_8);
						}
						if(CHn == 0x09)
						{
							FS_9     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_9     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_9 = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_9     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//				  		printf("FS_9 = %d FO_9=%d Npulse_9=%d Ms_9=%d\r\n",FS_9,FO_9,Npulse_9,Ms_9);
						}
						if(CHn == 0x0A)
						{
							FS_A     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_A     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_A = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_A     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//			    		printf("FS_A = %d FO_A=%d Npulse_A=%d Ms_A=%d\r\n",FS_A,FO_A,Npulse_A,Ms_A);
						}
						if(CHn == 0x0B)
						{
							FS_B     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_B     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_B = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_B     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//			      	printf("FS_B = %d FO_B=%d Npulse_B=%d Ms_B=%d\r\n",FS_B,FO_B,Npulse_B,Ms_B);
						}
						if(CHn == 0x0C)
						{
							FS_C     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_C     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);							
							Npulse_C = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_C     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//				  		printf("FS_C = %d FO_C=%d Npulse_C=%d Ms_C=%d\r\n",FS_C,FO_C,Npulse_C,Ms_C);
						}
						if(CHn == 0x0D)
						{
							FS_D     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_D     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_D = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_D     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//				  		printf("FS_D = %d FO_D=%d Npulse_D=%d Ms_D=%d\r\n",FS_D,FO_D,Npulse_D,Ms_D);
						}
						if(CHn == 0x0E)
						{
							FS_E     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_E     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_E = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_E     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//				  	  printf("FS_E = %d FO_E=%d Npulse_E=%d Ms_E=%d\r\n",FS_E,FO_E,Npulse_E,Ms_E);
						}
						if(CHn == 0x0F)
						{
							FS_F     = (parameter_buf[2]<<8)  + (parameter_buf[3]);
							FO_F     = (parameter_buf[4]<<16) + (parameter_buf[5]<<8) + (parameter_buf[6]);
							Npulse_F = (parameter_buf[7]<<24) + (parameter_buf[8]<<16)+ (parameter_buf[9]<<8)  + (parameter_buf[10]);
							Ms_F     = (parameter_buf[11]<<8) + (parameter_buf[12]);
//			        printf("FS_F = %d FO_F=%d Npulse_F=%d Ms_F=%d\r\n",FS_F,FO_F,Npulse_F,Ms_F);
						}
						
					} break;
			case 0xeb: 
					{
						NH  = parameter_buf[1];
						NL  = parameter_buf[2];
						Go  = parameter_buf[3];
//			      printf("N =%d  Go=%d\r\n",((NH<<8)+NL),Go);
					}	break;  
			default :  ;
						break;
 	}			
		memset(parameter_buf,0,13);
	}
	else
		assert_param(0);
}

void test_uart_tx_callback(void *param, uint8_t status)
{
	volatile uint8_t tmp1;
	volatile void * tmp2;
	if(status == STATUS_OK)
	{
		struct param_t *p = param;
		tmp1 = p->p1;
		tmp2 = tmp2;
		HAL_UART_Read(read_buf,2,test_uart_rx_finish,NULL);
	}
	else
		assert_param(0);
	
}

void test_tx_finish(void *param, uint8_t status)
{
	volatile uint8_t i;
	i = 9;
}

void test_uart0_write()
{
	param.p1 = 2;
	param.p2 = &param;
	HAL_UART_Write(str, 14, test_uart_tx_callback, &param);
}

 
void test_uart_send()
{
	HAL_UART_Write(str, 14, test_uart_tx_callback, &param);	
}

UART_Env_Tag env0;


void UART_INIT()
{
	volatile uint8_t i; 
	HAL_SYSCON_Function_IO_Set(UART_TXD,GPIO_8,1);
	HAL_SYSCON_Function_IO_Set(UART_RXD,GPIO_9,1);	 
	UART_Int_Register(HAL_UART_Isr,&env0);  	  //调用UART的中断处理函数
	
	UART_InitTypeDef config;
	config.UART_BaudRate = 115200;
	config.UART_DataLen = Data_Length_8_bits;
	config.UART_Parity = none_parity_check;
	config.UART_StopBits = stop_bit_1;
	HAL_UART_Init(APB_CLK0,config);         	   	 //通过结构体的参数初始化定UART
	
	HAL_UART_FIFO_Control(TX_Empty_Trigger_FIFO_Empty,RCVR_Trigger_FIFO_Two_Less_Than_Full);////RCVR_Trigger_One_Character
	
	NVIC_EnableIRQ(UART_IRQn);

}
