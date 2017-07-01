/**
  ******************************************************************************
  * @file    main.c
  * @author  Ac6
  * @version V1.0
  * @date    01-December-2013
  * @brief   Default main function.
  ******************************************************************************
*/


#include <RemoteHand.h>


int main(void)
{
	/*変数定義*/
	uint8_t Addr;

	DipSW_init();
	Bluetooth_init();
	IM315RTX_init();

	Addr = DipSW_read();
	switch(Addr){
	case 0:
		break;
	case 1:
		break;
	case 2:
		break;
	case 3:
		break;
	case 4:
		break;
	case 5:
		break;
	case 6:
		break;
	case 7:
		break;
	}

	while(1)
	{
//		USART_SendData();
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
	data = data|GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_10) << 0;
	data = data|GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_11) << 1;
	data = data|GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_12) << 2;
	return data;
}

void Bluetooth_init(void)
{
	GPIO_InitTypeDef init_gpio;
	USART_InitTypeDef init_usart;
//	USART_ClockInitTypeDef init_usartclock;

	/*USART2*/
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

	GPIO_StructInit(&init_gpio);
	init_gpio.GPIO_Pin = GPIO_Pin_2|GPIO_Pin_3;	//1
	init_gpio.GPIO_Mode = GPIO_Mode_AF;
	GPIO_Init(GPIOA,&init_gpio);
	GPIO_PinAFConfig(GPIOA,GPIO_PinSource2,GPIO_AF_1);
	GPIO_PinAFConfig(GPIOA,GPIO_PinSource3,GPIO_AF_1);

	USART_StructInit(&init_usart);
	USART_Init(USART2,&init_usart);
//	USART_ClockStructInit(&init_usartclock);
//	USART_ClockInit(USART2,init_usartclock);
	USART_Cmd(USART2,ENABLE);

	return;
}
void IM315RTX_init(void)
{
	GPIO_InitTypeDef init_gpio;
	USART_InitTypeDef init_usart;

	/*USART1*/
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);

	GPIO_StructInit(&init_gpio);
	init_gpio.GPIO_Pin = GPIO_Pin_6|GPIO_Pin_7;	//1
	init_gpio.GPIO_Mode = GPIO_Mode_AF;
	GPIO_Init(GPIOB,&init_gpio);
	GPIO_PinAFConfig(GPIOB,GPIO_PinSource6,GPIO_AF_0);
	GPIO_PinAFConfig(GPIOB,GPIO_PinSource7,GPIO_AF_0);

	USART_StructInit(&init_usart);
	USART_Init(USART2,&init_usart);
//	USART_ClockStructInit(&init_usartclock);
//	USART_ClockInit(USART2,init_usartclock);
	USART_Cmd(USART2,ENABLE);

	return;
}
