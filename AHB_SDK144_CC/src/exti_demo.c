#include "elf2.h"
#include "exti.h"
#include "uart.h"
#include "exti_demo.h"
#include "pulse_demo.h"
#include "int_register.h"

uint8_t strh[14] = {'E','L','F','2',' ','B','O','O','T',' ','A','K',0x0d,0x0a};
uint32_t counter;
void exti_isr()
{
//AHB_SENDING();
//HAL_UART_Write_Polling(strh, sizeof(strh));							//UARTÐ´Êý¾Ý¶ÎÂÖÑ¯º¯Êý
	HAL_EXTI_IntClr(EXT_INT_7);	
}


void EXTI_INIT()
{
    EXTI_InitTypeDef config;
    config.int_en = true;
    config.src = EXT_INT_7;
    config.type = NEGETIVE_EDGE;//HIGH_LEVEL;//LOW_LEVEL;//POSITIVE_EDGE;//NEGETIVE_EDGE;
    EXTINT_Int_Register(exti_isr,NULL);
    HAL_EXTI_Init(config);
    NVIC_EnableIRQ(EXT_IRQn);
    
}
