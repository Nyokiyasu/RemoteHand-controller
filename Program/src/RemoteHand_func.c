/*
 * RemoteHand_func.c
 *
 *  Created on: 2017/07/28
 *      Author: Yasu
 */

#include "RemoteHand.h"

/*�O���[�o���ϐ� ==================================================== */
//USART��M�p�̃����O�o�b�t�@
static ringBuffer_t Bluetooth_buffer, IM315TRX_buffer;

// �V�X�e���^�C�}�C1ms���Ƃ�1����������D
int gSystemTimer_ms = 0;

// delay�֐��̂��߂̃J�E���g�l
static int timingDelay_ms;

//ADC�̕ϊ����ʂ�DMA�ɂ���đ�������
//JoyX,Y,LeftU,V,W,RightU,V,W�̏��ԂɊi�[����Ă���
uint8_t ADC_value[8];

char FourBit2Ascii[] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};

/* -------------------------------------------------
 * @�֐���	:	Bluetooth_init,IM315TRX_init
 * @�T�v	:	Bluetooth,IM315TRX��USART������������
 * @����	:	�Ȃ�
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
	USART_InitStructure.USART_BaudRate = 19200;
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
 * @�֐���			:	Bluetooth_init,IM315TRX_init
 * @�T�v			:	Bluetooth,IM315TRX��USART������������
 * @����-command	:	�ʐM����̐ݒ�R�}���h
 * @�߂�l			:	�Ȃ�
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
 * @�֐���		:	Bluetooth_RecvByte, IM315TRX_RecvByte
 * @�T�v		:	Bluetooth, IM315TRX����1[Byte]�̏����󂯎��
 * @����		:	�Ȃ�
 * @�߂�l		:	��M�����f�[�^
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
 * @�֐���		:	Bluetooth_RecvString, IM315TRX_RecvString
 * @�T�v		:	Bluetooth, IM315TRX����max[Byte]�󂯎��A
 * 					������Ƃ��ĉ��߂���
 * @����-buf	:	�󂯎����������̊i�[��
 *      -max	:	������̒���[Byte]
 * @�߂�l		:	�G���[
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
 * @�T�v		:	Bluetooth, IM315TRX����1[Byte]���M����
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
	while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
	USART_SendData(USART1, byte);
}

/* -------------------------------------------------
 * @�֐���		:	Bluetooth_SendString, IM315TRX_SendString
 * @�T�v		:	Bluetooth, IM315TRX���當����𑗐M����
 * @����-buf	:	���M���镶����
 * @�߂�l		:	�Ȃ�
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
 * @�֐���		:	Bluetooth_SendRHCFrame,IM315TRX_SendRHCFlame
 * @�T�v		:	Bluetooth,IM315��RHC�̃f�[�^�t���[���𑗐M����
 * @����-byte	:	���M����f�[�^(8[byte])
 * ---------------------------------------------- */
void Bluetooth_SendRHCFrame(RHC_t *data)
{
	uint8_t i;
	for (i=0;i<8;i++)	Bluetooth_SendByte(data->SensorData.Bytes[i]);
}
int IM315TRX_SendRHCFrame(RHC_t *data)
{
	uint16_t i;
	char check[8];
	int time0;

	time0 = SystemTimer_ms_Check();
	while(Check_Busy())
	{
		if((SystemTimer_ms_Check()-time0) > IM315TRX_SEND_TIMEOUT_MS)	return -1;
	}

	IM315TRX_SendString("TXDT ");
	for (i=0;i<16;i++)	IM315TRX_SendByte(data->SendData[i]);
	IM315TRX_SendString("\r\n");

//	IM315TRX_RecvString(check,8);
//	if(CoincidenceCheck(check,"OK",2))	return 0;
//	else	return -1;
	return 0;
}

/* -------------------------------------------------
 * @�֐���		:	CoincidenceCheck
 * @�T�v		:	num�Ŏw�肵��������2�̕�������r����
 * @����-str1	:	��r���镶����1
 * @����-str2	:	��r���镶����2
 * @����-num	:	������̒���
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
 * @�֐���		:	DipSW_init
 * @�T�v		:	DipSW�Ɏg��GPIO�̏�����
 * @�߂�l		:	�Ȃ�
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

/* -------------------------------------------------
 * @�֐���		:	DipSW_read
 * @�T�v		:	DipSW�̓Ǐo��
 * @�߂�l		:	�Ȃ�
 * ---------------------------------------------- */
uint8_t DipSW_read(void)
{
	uint8_t data=0;
	data = data|GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_10) << 0;
	data = data|GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_11) << 1;
	data = data|GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_12) << 2;
	return data;
}

/* -------------------------------------------------
 * @�֐���		:	Switches_init
 * @�T�v		:	�茳�̃X�C�b�`�̏�����
 * @�߂�l		:	�Ȃ�
 * ---------------------------------------------- */
void Switches_init(void)
{
	GPIO_InitTypeDef init_gpio;

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOF, ENABLE);

	/*CW&CCW&EmSW*/
	GPIO_StructInit(&init_gpio);
	init_gpio.GPIO_Pin = GPIO_Pin_8|GPIO_Pin_9|GPIO_Pin_15;	//
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
 * @�֐���		:	ADC_init
 * @�T�v		:	�A�i���O�Z���T�|�[�g�̏�����
 * 				 	DMA��p���ĘA�����[�h�ŋN��
 * @�߂�l		:	�Ȃ�
 * ---------------------------------------------- */
void ADCPort_init(void)
{
	GPIO_InitTypeDef	GPIO_InitStructure;
	ADC_InitTypeDef		ADC_InitStructure;
	DMA_InitTypeDef		DMA_InitStructure;

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);

	/*GPIO�̏�����*/
	GPIO_StructInit(&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7;	//
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
	GPIO_Init(GPIOA,&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1;
	GPIO_Init(GPIOB,&GPIO_InitStructure);

	/*DMA�̏�����*/
	//Syscinfig��DMA�̍Ĕz�u�����Ȃ���΂����Ȃ�
	SYSCFG_DMAChannelRemapConfig(SYSCFG_DMARemap_ADC1,ENABLE);
	DMA_DeInit(DMA1_Channel1);
	DMA_StructInit(&DMA_InitStructure);
	DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)&ADC1->DR;
	DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)&ADC_value[0];
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
	DMA_InitStructure.DMA_BufferSize = 8;
	DMA_InitStructure.DMA_MemoryInc =  DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
	DMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;
	DMA_Init(DMA1_Channel1,&DMA_InitStructure);
	DMA_SetCurrDataCounter(DMA1_Channel1,8);
	DMA_Cmd(DMA1_Channel1,ENABLE);

	/*ADC�̏�����*/
	ADC_StructInit(&ADC_InitStructure);
	ADC_InitStructure.ADC_Resolution = ADC_Resolution_8b;
	ADC_InitStructure.ADC_ContinuousConvMode = ENABLE;
	ADC_Init(ADC1,&ADC_InitStructure);
//	ADC_ContinuousModeCmd(ADC1,ENABLE);

	ADC_ChannelConfig(ADC1, ADC_Channel_0 , ADC_SampleTime_41_5Cycles);
	ADC_ChannelConfig(ADC1, ADC_Channel_1 , ADC_SampleTime_41_5Cycles);
	ADC_ChannelConfig(ADC1, ADC_Channel_4 , ADC_SampleTime_41_5Cycles);
	ADC_ChannelConfig(ADC1, ADC_Channel_5 , ADC_SampleTime_41_5Cycles);
	ADC_ChannelConfig(ADC1, ADC_Channel_6 , ADC_SampleTime_41_5Cycles);
	ADC_ChannelConfig(ADC1, ADC_Channel_7 , ADC_SampleTime_41_5Cycles);
	ADC_ChannelConfig(ADC1, ADC_Channel_8 , ADC_SampleTime_41_5Cycles);
	ADC_ChannelConfig(ADC1, ADC_Channel_9 , ADC_SampleTime_41_5Cycles);

	ADC_DMARequestModeConfig(ADC1,ADC_DMAMode_Circular);
	ADC_DMACmd(ADC1,ENABLE);
	ADC_Cmd(ADC1,ENABLE);

	ADC_StartOfConversion(ADC1);
}

void GetSensorData(RHC_t *data)
{
	data->SensorData.Sepalate.Right_Shoulder= ADC_value[R_SHOULDER_NUM];
	data->SensorData.Sepalate.Right_Elbow	= ADC_value[R_ELBOW_NUM];
	data->SensorData.Sepalate.Right_wrist	= ADC_value[R_WRIST_NUM];
	data->SensorData.Sepalate.Left_Shoulder	= ADC_value[L_SHOULDER_NUM];
	data->SensorData.Sepalate.Left_Elbow	= ADC_value[L_ELBOW_NUM];
	data->SensorData.Sepalate.Left_wrist	= ADC_value[L_WRIST_NUM];
	data->SensorData.Sepalate.Joy_X			= ADC_value[JOY_X_NUM]>>4;
	data->SensorData.Sepalate.Joy_Y			= ADC_value[JOY_Y_NUM]>>4;
	data->SensorData.Sepalate.Wall			= Check_wall();
	data->SensorData.Sepalate.CCW			= Check_ccw();
	data->SensorData.Sepalate.CW			= Check_cw();
}


void Conv4Bit2Ascii(RHC_t *data)
{
	uint8_t i;

	for(i=0;i<8;i++)
	{
		data->SendData[i*2]		= FourBit2Ascii[data->SensorData.HalfBytes[i].Lower];
		data->SendData[i*2+1]	= FourBit2Ascii[data->SensorData.HalfBytes[i].Higher];
	}
}

/* -------------------------------------------------
 * @�֐���	:	USART1_IRQHandler, USART2_IRQHandler
 * @�T�v	:	USART1, USART2�̎�M���荞�݃��[�`��
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
 * @�֐���	:	SysTick_Handler
 * @�T�v	:	SystickTimer�̊��荞�݃��[�`��
 * 				SysTick_Config�Őݒ肵���l(frq)�Ŋ��荞�ݎ��������܂�
 * 				������SystemClock/frq[Hz]
 * ---------------------------------------------- */
void SysTick_Handler(void)
{
	gSystemTimer_ms++;
	if(timingDelay_ms)	timingDelay_ms--;
}

/* -------------------------------------------------
 * @�֐���		:	delay_ms
 * @�T�v		:	�w�莞�ԋ󃋁[�v������D
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