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

/*�O���[�o���ϐ� ==================================================== */
static ringBuffer_t Bluetooth_buffer, IM315TRX_buffer;
// �V�X�e���^�C�}�C1ms���Ƃ�1����������D
int gSystemTimer_ms = 0;
// delay�֐��̂��߂̃J�E���g�l
static int timingDelay_ms;


int main(void)
{
	/*�ϐ���`*/
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
	IM315TRX_USART_init();
	Bluetooth_USART_init();

//	switch(mode){
//	case 0:
//		Bluetooth_Module_init(CONNECTCOMMAND0);
//		break;
//	case 1:
//		Bluetooth_Module_init(CONNECTCOMMAND1);
//		break;
//	case 2:
//		Bluetooth_Module_init(CONNECTCOMMAND2);
//		break;
//	case 3:
//		Bluetooth_Module_init(CONNECTCOMMAND3);
//		break;
//	case 4:
//		Bluetooth_Module_init(CONNECTCOMMAND4);
//		break;
//	case 5:
//		Bluetooth_Module_init(CONNECTCOMMAND5);
//		break;
//	case 6:
//		Bluetooth_Module_init(CONNECTCOMMAND6);
//		break;
//	case 7:
//		Bluetooth_Module_init(CONNECTCOMMAND7);
//		break;
//		}

	while(1)
	{
		IM315TRX_SendRHCFrame("12345678");
	}

}

/* -------------------------------------------------
 * @�֐���	:	Bluetooth_init,IM315TRX_init
 * @�T�v		:	Bluetooth,IM315TRX��USART������������
 * @����		:	�Ȃ�
 * @�߂�l	:	�Ȃ�
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
void IM315TRX_USART_init(void)
{
	GPIO_InitTypeDef	GPIO_InitStructure;
	USART_InitTypeDef	USART_InitStructure;
	NVIC_InitTypeDef	NVIC_InitStructure;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);

	/*busy*/
	GPIO_StructInit(&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_Init(GPIOB,&GPIO_InitStructure);

	/*USART1*/
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
 * @�֐���		:	Bluetooth_init,IM315TRX_init
 * @�T�v			:	Bluetooth,IM315TRX��USART������������
 * @����	-command:	�ʐM����̐ݒ�R�}���h
 * @�߂�l		:	�Ȃ�
 * ---------------------------------------------- */
void Bluetooth_Module_init(char *command)
{
	char buff[128] = {0};

	Bluetooth_RecvString(buff,128); //"OK"���󂯂��͂�
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
 * @�֐���	:	Bluetooth_RecvByte, IM315TRX_RecvByte
 * @�T�v		:	Bluetooth, IM315TRX����1[Byte]�̏����󂯎��
 * @����		:	�Ȃ�
 * @�߂�l	:	��M�����f�[�^
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
int	IM315TRX_RecvByte(void)
{
	int data;
	int time0;

	time0 = SystemTimer_ms_Check();
	while(IM315TRX_buffer.recvPtr_in == IM315TRX_buffer.recvPtr_out)
	{
		if((SystemTimer_ms_Check()-time0) > IM315TRX_RECV_TIMEOUT_MS)	return -1;
	}

	data = IM315TRX_buffer.buff[IM315TRX_buffer.recvPtr_out];

	if(++IM315TRX_buffer.recvPtr_out == RECV_RINGBUFF_SIZE)
	{
		IM315TRX_buffer.recvPtr_out = 0;
	}
	return data;
}

/* -------------------------------------------------
 * @�֐���	:	Bluetooth_RecvString, IM315TRX_RecvString
 * @�T�v		:	Bluetooth, IM315TRX����max[Byte]�󂯎��A
 * 				������Ƃ��ĉ��߂���
 * @����-buf	:	�󂯎����������̊i�[��
 *�@          -max	:	������̒���[Byte]
 * @�߂�l	:	�G���[
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
int IM315TRX_RecvString (char *buf, int max)
{
	int i;
	for(i = 0; i < max-i; i++)
	{
		*buf = IM315TRX_RecvByte();

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
 * @�֐���		:	Bluetooth_SendByte, IM315TRX_SendByte
 * @�T�v			:	Bluetooth, IM315TRX����1[Byte]���M����
 * @����-byte	:	���M����1[Byte]����
 * @�߂�l		:	�Ȃ�
 * ---------------------------------------------- */
void Bluetooth_SendByte(uint8_t byte)
{
	while (USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET);
	USART_SendData(USART2, byte);
}
void IM315TRX_SendByte(uint8_t byte)
{
	while (USART_GetFlagStatus(USART3, USART_FLAG_TC) == RESET);
	USART_SendData(USART3, byte);
}

/* -------------------------------------------------
 * @�֐���	:	Bluetooth_SendString, IM315TRX_SendString
 * @�T�v		:	Bluetooth, IM315TRX���當����𑗐M����
 * @����-buf	:	���M���镶����
 * @�߂�l	:	�Ȃ�
 * ---------------------------------------------- */
void Bluetooth_SendString(char *str)
{
	while(*str)
	{
		Bluetooth_SendByte(*str++);
	}
}
void IM315TRX_SendString(char *str)
{
	while(*str)
	{
		IM315TRX_SendByte(*str++);
	}
}

/* -------------------------------------------------
 * @�֐���		:IM315TRX_SendFlame
 * @�T�v			:IM315�̃t���[���𑗐M����
 * @����-byte	:���M����f�[�^8[byte]�̂ݑ��M�����
 * ---------------------------------------------- */
int IM315TRX_SendRHCFrame(RHC_t *data)
{
	uint16_t i;
	char check[8];
	int time0;

	time0 = SystemTimer_ms_Check();
	while(Busy_Check())
	{
		if((SystemTimer_ms_Check()-time0) > IM315TRX_SEND_TIMEOUT_MS)	return -1;
	}

	IM315TRX_SendString("TXDT ");
	for (i=0;i<8;i++)	IM315TRX_SendByte(data++->bytes[i]);
	IM315TRX_SendString("\r\n");

	IM315TRX_RecvString(&check,8);
	if(CoincidenceCheck(&check,"OK",2))	return 0;
	return -1;
}

/* -------------------------------------------------
 * @�֐���		:	CoincidenceCheck
 * @�T�v			:	num�Ŏw�肵��������2�̕�������r����
 * @����-str1	:	��r���镶����1
 * @����-str2	:	��r���镶����2
 * @����-num		:	������̒���
 * @�߂�l		:	����or���s
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
 * @�֐���		:
 * @�T�v			:
 * @����			:
 * @�߂�l		:
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
 * @�֐���	:	USART1_IRQHandler, USART2_IRQHandler
 * @�T�v		:	USART1, USART2�̎�M���荞�݃��[�`��
 * ---------------------------------------------- */
void USART1_IRQHandler(void)
{
	// ��M�I��
	if(USART_GetITStatus(USART1, USART_IT_RXNE) == SET)
	{
		IM315TRX_buffer.buff[IM315TRX_buffer.recvPtr_in] = USART_ReceiveData(USART1);
		if(++IM315TRX_buffer.recvPtr_in == RECV_RINGBUFF_SIZE)
		{
			IM315TRX_buffer.recvPtr_in = 0;
		}
	}
}
void USART2_IRQHandler(void)
{
	// ��M�I��
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
 * @�֐���		:	SysTick_Handler
 * @�T�v			:	SystickTimer�̊��荞�݃��[�`��
 * 					SysTick_Config�Őݒ肵���l(frq)�Ŋ��荞�ݎ��������܂�
 * 					������SystemClock/frq[Hz]
 * ---------------------------------------------- */
void SysTick_Handler(void)
{
	gSystemTimer_ms++;
	if(timingDelay_ms)	timingDelay_ms--;
}

/* -------------------------------------------------
 * @�֐���		:	delay_ms
 * @�T�v			:	�w�莞�ԋ󃋁[�v������D
 * 					SystemCMT�������������ɌĂяo���ƁC
 * 					�������[�v���Ă��܂��D
 * @����-msec	:	���[�v���鎞��[ms]
 * @�߂�l		:	�Ȃ�
 * ---------------------------------------------- */
void delay_ms(int msec)
{
	timingDelay_ms = msec;
	while(timingDelay_ms);
}
