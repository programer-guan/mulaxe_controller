#include "intc.h"
#include "exti.h"
#include "timer_demo.h"
#include "pulse_demo.h"
#include "uart_demo.h"
#include "exti_demo.h"
#include "segger_rtt.h"

uint8_t read_buf[20];
uint8_t parameter_buf[20];

uint32_t I_0,I_1,I_2,I_3,I_4,I_5,I_6,I_7,I_8,I_9,I_A,I_B,I_C,I_D,I_E,I_F;
/*CD 00 03 E8 00 07 D0 00 00 03 56 00 FF*/
/*EB 00 01 01 00 00 00 00 00 00 00 00 00*/
int main() 
{   
  UART_INIT();
//EXTI_INIT();
	TIMER_INIT();
  while(1)
	{
		limit 	 = AHB_In32(AHB_BaseAddr1 +0x00000200);   		//传递limit参数
		limit 	 = AHB_In32(AHB_BaseAddr1 +0x00000200);
		rd_state = AHB_In32(AHB_BaseAddr1 +0x00000080);   		//传递rd_state参数
		rd_state = AHB_In32(AHB_BaseAddr1 +0x00000080);   
		CHn_Message_Send();
		if(rd_state ==0x00000000)
		{
			HAL_UART_Read(parameter_buf,13,uart_rx_finish,NULL);
			if(Go ==0x01) 	
			{
				NVIC_EnableIRQ(TIMER_IRQn);
				CHn_ORDER_SEND(NH,NL,Go);
			}
		}
		NVIC_DisableIRQ(TIMER_IRQn);
		I_0 = 0;I_1 = 0;I_2 = 0;I_3 = 0;I_4 = 0;I_5 = 0;I_6 = 0;I_7 = 0;
		I_8 = 0;I_9 = 0;I_A = 0;I_B = 0;I_C = 0;I_D = 0;I_E = 0;I_F = 0;
	}
}
