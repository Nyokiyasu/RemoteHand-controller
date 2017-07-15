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

/*グローバル変数 ==================================================== */
static ringBuffer_t Bluetooth_buffer, IM315RTX_buffer;
// システムタイマ，1msごとに1ずつ増加する．
int gSystemTimer_ms = 0;
// delay関数のためのカウント値
static int timingDelay_ms;


int main(void)
{
	/*変数定義*/
	uint8_t mode;
	RHC_t data;

	RCC_PLLConfig(RCC_PLLSource_HSI_Div2,RCC_PLLMul_12);
	RCC_PLLCmd(ENABLE);
	RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

	DipSW_init();
	Switches_init();
	mode = DipSW_read();

	SysTick_Config(48000);
//	IM315RTX_USART_init();
	Bluetooth_USART_init();

	switch(mode){
	case 0:
		Bluetooth_Module_init(CONNECTCOMMAND0);
		break;
	case 1:
		Bluetooth_Module_init(CONNECTCOMMAND1);
		break;
	case 2:
		Bluetooth_Module_init(CONNECTCOMMAND2);
		break;
	case 3:
		Bluetooth_Module_init(CONNECTCOMMAND3);
		break;
	case 4:
		Bluetooth_Module_init(CONNECTCOMMAND4);
		break;
	case 5:
		Bluetooth_Module_init(CONNECTCOMMAND5);
		break;
	case 6:
		Bluetooth_Module_init(CONNECTCOMMAND6);
		break;
	case 7:
		Bluetooth_Module_init(CONNECTCOMMAND7);
		break;
		}

	while(1)
	{
		Bluetooth_SendString("Hello World\r\n");
	}

}

/* -------------------------------------------------
 * @関数名	:	Bluetooth_init,IM315RTX_init
 * @概要		:	Bluetooth,IM315RTXのUSARTを初期化する
 * @引数		:	なし
 * @戻り値	:	なし
 * ---------------------------------------------- */
void Bluetooth_USART_init(void)
{
	GPIO_InitTypeDef	GPIO_InitStructure;
	USART_InitTypeDef	USART_InitStructure;
	NVIC_InitTypeDef	NVIC_InitStructure;

	/*USART2*/
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

	GPIO_StructInit(&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2|GPIO_Pin_3;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_Init(GPIOA,&GPIO_InitStructure);
	GPIO_PinAFConfig(GPIOA,GPIO_PinSource2,GPIO_AF_1);
	GPIO_PinAFConfig(GPIOA,GPIO_PinSource3,GPIO_AF_1);

	USART_StructInit(&USART_InitStructure);
	USART_Init(USART2,&USART_InitStructure);

	NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	USART_ITConfig(USART2,USART_IT_RXNE,ENABLE);
	USART_Cmd(USART2,ENABLE);

	return;
}
void IM315RTX_USART_init(void)
{
	GPIO_InitTypeDef	GPIO_InitStructure;
	USART_InitTypeDef	USART_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;

	/*USART1*/
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);

	GPIO_StructInit(&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6|GPIO_Pin_7;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_Init(GPIOB,&GPIO_InitStructure);
	GPIO_PinAFConfig(GPIOB,GPIO_PinSource6,GPIO_AF_0);
	GPIO_PinAFConfig(GPIOB,GPIO_PinSource7,GPIO_AF_0);

	USART_StructInit(&USART_InitStructure);
	USART_InitStructure.USART_BaudRate = 38400;
	USART_Init(USART1,&USART_InitStructure);

	NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	USART_ITConfig(USART1,USART_IT_RXNE,ENABLE);
	USART_Cmd(USART1,ENABLE);

	return;
}

/* -------------------------------------------------
 * @関数名		:	Bluetooth_init,IM315RTX_init
 * @概要			:	Bluetooth,IM315RTXのUSARTを初期化する
 * @引数	-command:	通信相手の設定コマンド
 * @戻り値		:	なし
 * ---------------------------------------------- */
void Bluetooth_Module_init(char *command)
{
	char buff[128] = {0};

	Bluetooth_RecvString(buff,128); //"OK"を受けたはず
	while (!CoincidenceCheck(buff,"OK",2))
	{
		Bluetooth_RecvString(buff,128);
	}
	if (command)
	{
		Bluetooth_SendString(command);
		Bluetooth_SendString("\r\n");
	}
	Bluetooth_RecvString(buff,128);
	while (!CoincidenceCheck(buff,"OK",2))
	{
		Bluetooth_RecvString(buff,128);
	}
	Bluetooth_RecvString(buff,128);
	while (!CoincidenceCheck(buff,"CONNECT",7))
	{
		Bluetooth_RecvString(buff,128);
	}
	return;
}

/* -------------------------------------------------
 * @関数名	:	Bluetooth_RecvByte, IM315RTX_RecvByte
 * @概要		:	Bluetooth, IM315RTXから1[Byte]の情報を受け取る
 * @引数		:	なし
 * @戻り値	:	受信したデータ
 * ---------------------------------------------- */
int Bluetooth_RecvByte(void)
{
	int data;
	int time0;

	time0 = SystemTimer_ms_Check();
	while(Bluetooth_buffer.recvPtr_in == Bluetooth_buffer.recvPtr_out)
	{
		if((SystemTimer_ms_Check()-time0) > BLUETOOTH_RECV_TIMEOUT_MS)	return -1;
	}

	data = Bluetooth_buffer.buff[Bluetooth_buffer.recvPtr_out];

	if(++Bluetooth_buffer.recvPtr_out == RECV_RINGBUFF_SIZE)
	{
		Bluetooth_buffer.recvPtr_out = 0;
	}
	return data;
}
int	IM315RTX_RecvByte(void)
{
	int data;
	int time0;

	time0 = SystemTimer_ms_Check();
	while(IM315RTX_buffer.recvPtr_in == IM315RTX_buffer.recvPtr_out)
	{
		if((SystemTimer_ms_Check()-time0) > IM315RTX_RECV_TIMEOUT_MS)	return -1;
	}

	data = IM315RTX_buffer.buff[IM315RTX_buffer.recvPtr_out];

	if(++IM315RTX_buffer.recvPtr_out == RECV_RINGBUFF_SIZE)
	{
		IM315RTX_buffer.recvPtr_out = 0;
	}
	return data;
}

/* -------------------------------------------------
 * @関数名	:	Bluetooth_RecvString, IM315RTX_RecvString
 * @概要		:	Bluetooth, IM315RTXからmax[Byte]受け取り、
 * 				文字列として解釈する
 * @引数-buf	:	受け取った文字列の格納先
 *　          -max	:	文字列の長さ[Byte]
 * @戻り値	:	エラー
 * ---------------------------------------------- */
int	Bluetooth_RecvString(char *buf, int max)
{
	int i;
	for(i = 0; i < max-i; i++)
	{
		*buf = Bluetooth_RecvByte();

		if((signed char)*buf == -1)	return -1;
		if(*buf == '\r')
		{
			*buf = 0;
			return i+1;
		}
		if(*buf == 0x08)
		{
			buf -= 2;
			i -= 2;
		}
		if(*buf != '\n')	buf++;
		else				i--;
	}
	*buf = 0;
	return i+1;
}
int IM315RTX_RecvString (char *buf, int max)
{
	int i;
	for(i = 0; i < max-i; i++)
	{
		*buf = IM315RTX_RecvByte();

		if(*buf == -1)	return -1;
		if(*buf == '\r')
		{
			*buf = 0;
			return i+1;
		}
		if(*buf == 0x08)
		{
			buf -= 2;
			i -= 2;
		}
		if(*buf != '\n')	buf++;
		else				i--;
	}
	*buf = 0;
	return i+1;
}

/* -------------------------------------------------
 * @関数名		:	Bluetooth_SendByte, IM315RTX_SendByte
 * @概要			:	Bluetooth, IM315RTXから1[Byte]送信する
 * @引数-byte	:	送信する1[Byte]文字
 * @戻り値		:	なし
 * ---------------------------------------------- */
void Bluetooth_SendByte(uint8_t byte)
{
	while (USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET);
	USART_SendData(USART2, byte);
}
void IM315RTX_SendByte(uint8_t byte)
{
	while (USART_GetFlagStatus(USART3, USART_FLAG_TC) == RESET);
	USART_SendData(USART3, byte);
}

/* -------------------------------------------------
 * @関数名	:	Bluetooth_SendString, IM315RTX_SendString
 * @概要		:	Bluetooth, IM315RTXから文字列を送信する
 * @引数-buf	:	送信する文字列
 * @戻り値	:	なし
 * ---------------------------------------------- */
void Bluetooth_SendString(char *str)
{
	while(*str)
	{
		Bluetooth_SendByte(*str++);
	}
}
void IM315RTX_SendString(char *str)
{
	while(*str)
	{
		IM315RTX_SendByte(*str++);
	}
}

/* -------------------------------------------------
 * @関数名		:IM315RTX_SendFlame
 * @概要			:
 * @引数-byte	:
 * @戻り値		:
 * ---------------------------------------------- */
void IM315RTX_SendRHCFrame(RHC_t *data)
{
	uint16_t i;
	IM315RTX_SendString("TXDT ");
	for (i=0;i<8;i++)	IM315RTX_SendByte(data->bytes[i]);
	IM315RTX_SendString("\r\n");
	return;
}

/* -------------------------------------------------
 * @関数名		:	CoincidenceCheck
 * @概要			:	numで指定した長さの2つの文字列を比較する
 * @引数-str1	:	比較する文字列1
 * @引数-str2	:	比較する文字列2
 * @引数-num		:	文字列の長さ
 * @戻り値		:	成功or失敗
 * ---------------------------------------------- */
uint16_t CoincidenceCheck(char *str1,char *str2,uint16_t num)
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

/* -------------------------------------------------
 * @関数名		:
 * @概要			:
 * @引数			:
 * @戻り値		:
 * ---------------------------------------------- */
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

void Switches_init(void)
{
	GPIO_InitTypeDef init_gpio;

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOF, ENABLE);

	/*CW&CCW*/
	GPIO_StructInit(&init_gpio);
	init_gpio.GPIO_Pin = GPIO_Pin_8|GPIO_Pin_9;	//
	init_gpio.GPIO_Mode = GPIO_Mode_IN;
	GPIO_Init(GPIOA,&init_gpio);
	/*Enable&Wall*/
	GPIO_StructInit(&init_gpio);
	init_gpio.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1;	//
	init_gpio.GPIO_Mode = GPIO_Mode_IN;
	GPIO_Init(GPIOF,&init_gpio);

	return;
}

/* -------------------------------------------------
 * @関数名	:	USART1_IRQHandler, USART2_IRQHandler
 * @概要		:	USART1, USART2の受信割り込みルーチン
 * ---------------------------------------------- */
void USART1_IRQHandler(void)
{
	// 受信終了
	if(USART_GetITStatus(USART1, USART_IT_RXNE) == SET)
	{
		IM315RTX_buffer.buff[IM315RTX_buffer.recvPtr_in] = USART_ReceiveData(USART1);
		if(++IM315RTX_buffer.recvPtr_in == RECV_RINGBUFF_SIZE)
		{
			IM315RTX_buffer.recvPtr_in = 0;
		}
	}
}
void USART2_IRQHandler(void)
{
	// 受信終了
	if(USART_GetITStatus(USART2, USART_IT_RXNE) == SET)
	{
		Bluetooth_buffer.buff[Bluetooth_buffer.recvPtr_in] = USART_ReceiveData(USART2);
		if(++Bluetooth_buffer.recvPtr_in == RECV_RINGBUFF_SIZE)
		{
			Bluetooth_buffer.recvPtr_in = 0;
		}
	}
}
/* -------------------------------------------------
 * @関数名		:	SysTick_Handler
 * @概要			:	SystickTimerの割り込みルーチン
 * 					SysTick_Configで設定した値(frq)で割り込み周期が決まる
 * 					周期はSystemClock/frq[Hz]
 * ---------------------------------------------- */
void SysTick_Handler(void)
{
	gSystemTimer_ms++;
	if(timingDelay_ms)	timingDelay_ms--;
}

/* -------------------------------------------------
 * @関数名		:	delay_ms
 * @概要			:	指定時間空ループをする．
 * 					SystemCMTを初期化せずに呼び出すと，
 * 					無限ループしてしまう．
 * @引数-msec	:	ループする時間[ms]
 * @戻り値		:	なし
 * ---------------------------------------------- */
void delay_ms(int msec)
{
	timingDelay_ms = msec;
	while(timingDelay_ms);
}
