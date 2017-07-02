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
	uint8_t mode;

	DipSW_init();
	mode = DipSW_read();

	IM315RTX_init();
	switch(mode){
	case 0:
		Bluetooth_init(CONNECTCOMMAND0);
		break;
	case 1:
		Bluetooth_init(CONNECTCOMMAND1);
		break;
	case 2:
		Bluetooth_init(CONNECTCOMMAND2);
		break;
	case 3:
		Bluetooth_init(CONNECTCOMMAND3);
		break;
	case 4:
		Bluetooth_init(CONNECTCOMMAND4);
		break;
	case 5:
		Bluetooth_init(CONNECTCOMMAND5);
		break;
	case 6:
		Bluetooth_init(CONNECTCOMMAND6);
		break;
	case 7:
		Bluetooth_init(CONNECTCOMMAND7);
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

void Bluetooth_init(char* command)
{
	GPIO_InitTypeDef init_gpio;
	USART_InitTypeDef init_usart;
	char buff[128];

	/*USART2*/
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

	GPIO_StructInit(&init_gpio);
	init_gpio.GPIO_Pin = GPIO_Pin_2|GPIO_Pin_3;
	init_gpio.GPIO_Mode = GPIO_Mode_AF;
	GPIO_Init(GPIOA,&init_gpio);
	GPIO_PinAFConfig(GPIOA,GPIO_PinSource2,GPIO_AF_1);
	GPIO_PinAFConfig(GPIOA,GPIO_PinSource3,GPIO_AF_1);
	USART_StructInit(&init_usart);
	USART_Init(USART2,&init_usart);
	USART_Cmd(USART2,ENABLE);


	USART_GetString(USART2,buff,128); /*"OK"を受けたはず*/
	while (!coincidenceCheck(buff,"OK",2))
	{
		USART_GetString(USART2,buff,128);
	}
	if (command)
	{
		USART_PutString(USART2,command);
		USART_PutString(USART2,"\r\n");
	}
	USART_GetString(USART2,buff,128);
	while (!coincidenceCheck(buff,"OK",2))
	{
		USART_GetString(USART2,buff,128);
	}
	USART_GetString(USART2,buff,128);
	while (!coincidenceCheck(buff,"CONNECT",7))
	{
		USART_GetString(USART2,buff,128);
	}

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

void USART_PutString(USART_TypeDef* USARTx,char* str)
{
	while (*str)
	{
		USART_SendData(USARTx,*str);
		str++;
	}
}

uint16_t USART_GetString(USART_TypeDef* USARTx,char* buff,uint16_t max)
{
	uint16_t ch,i;

	for (i=0;i<max-1;i++) {
		ch=	USART_ReceiveData(USARTx);;
		*buff=(char)ch;

		if (*buff=='\r'||ch<0) {
			*buff=0;
			return i+1;
		}

		if (*buff==0x8) {
			buff-=2;
			i-=2;
		}
		if (*buff!='\n'){
		    buff++;
		}
		else i--;
	}
	*buff=0;
	return i+1;
}

uint16_t coincidenceCheck(char *str1,char *str2,uint16_t num)
{
	uint16_t coincidence=1;
	uint16_t i;
	for (i=0;i<num;i++) {
		if (*str1++!=*str2++) {
			coincidence=0;
			break;
		}
	}
	return coincidence;
}
