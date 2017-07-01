/**
  ******************************************************************************
  * @file    main.c
  * @author  Ac6
  * @version V1.0
  * @date    01-December-2013
  * @brief   Default main function.
  ******************************************************************************
*/


#include "stm32f0xx.h"


void DipSW_init(void);
uint8_t DipSW_read(void);

int main(void)
{
	uint8_t Addr;
	/*変数定義*/

	DipSW_init();

	while(1)
	{
			Addr = DipSW_read();
	}

}

void DipSW_init(void)
{
	GPIO_InitTypeDef init_gpio;

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

	/*DipSW*/
	GPIO_StructInit(&init_gpio);
	init_gpio.GPIO_Pin = GPIO_Pin_10|GPIO_Pin_11|GPIO_Pin_12;	//
	init_gpio.GPIO_Mode = GPIO_Mode_IN;
	GPIO_Init(GPIOA,&init_gpio);

	return;

}

uint8_t DipSW_read(void)
{
	uint8_t data=0;
	data = GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_10) << 0;
	data = data|GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_11) << 1;
	data = data|GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_12) << 2;
	return data;
}
