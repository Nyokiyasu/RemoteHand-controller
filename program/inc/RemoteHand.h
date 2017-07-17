/*
 * main.h
 *
 *  Created on: 2017/07/01
 *      Author: Yasu
 */

#ifndef REMOTEHAND_H_
#define REMOTEHAND_H_

#include "stm32f0xx.h"
//#include "stm32f0xx_conf.h"

/*ATD+繋ぎたいBlueToothのアドレスを指定*/
#define CONNECTCOMMAND0 "ATD00019508D9CC" /*class1*/
#define CONNECTCOMMAND1 "ATD00019508D9D0" /*class1*/
#define CONNECTCOMMAND2 "ATD00019508D940" /*class1*/
#define CONNECTCOMMAND3 "ATD00019509C3FD" /*class2*/
#define CONNECTCOMMAND4 "ATD00019509C400" /*class2*/
#define CONNECTCOMMAND5 "ATD00019518A0DE" /*class2*/
#define CONNECTCOMMAND6 "ATD00019518A0CD" /*class2*/
#define CONNECTCOMMAND7 "ATD2016D8649BFB" /*伊藤PCのBluetoothアドレス*/

#define RECV_RINGBUFF_SIZE 16
#define IM315TRX_RECV_TIMEOUT_MS 500
#define IM315TRX_SEND_TIMEOUT_MS 500
#define BLUETOOTH_RECV_TIMEOUT_MS 500

#define SystemTimer_ms_Check()		(gSystemTimer_ms)
#define Busy_Check()				(GPIO_ReadOutputDataBit(GPIOB,GPIO_Pin_4))


/*構造体定義 ==================================================== */
typedef struct {
	union{
		struct {
			uint8_t Right_Shoulder;
			uint8_t Right_Elbow;
			uint8_t Right_wrist;
			uint8_t Left_Shoulder;
			uint8_t Left_Elbow;
			uint8_t Left_wrist;
			uint8_t Joy_X		:4;
			uint8_t Joy_Y		:4;
			uint8_t Em_SW		:4;
			uint8_t Reserved 	:2;
			uint8_t CCW			:1;
			uint8_t CW			:1;
		} Sepalate;
		uint8_t bytes[8];
	} SensorData;
	uint8_t SendData[16];
} RHC_t;

/* リングバッファ関係 */
typedef struct
{
	/* ポインタ */
	volatile int recvPtr_in;
	volatile int recvPtr_out;
	/* バッファ */
	uint8_t buff[RECV_RINGBUFF_SIZE];
} ringBuffer_t;


/*プロトタイプ宣言 ==================================================== */
/*DIO関係*/
void DipSW_init(void);
uint8_t DipSW_read(void);
void Switches_init(void);
/*USART関係*/
void Bluetooth_USART_init(void);
void Bluetooth_Module_init(char* command);
int Bluetooth_RecvByte(void);
int	Bluetooth_RecvString(char *buf, int max);
void Bluetooth_SendByte(uint8_t byte);
void Bluetooth_SendString(char *str);
void Bluetooth_SendRHCFrame(RHC_t *data);

void IM315TRX_USART_init(void);
int	IM315TRX_RecvByte(void);
int IM315TRX_RecvString (char *buf, int max);
void IM315TRX_SendByte(uint8_t byte);
void IM315TRX_SendString(char *str);
int IM315TRX_SendRHCFrame(RHC_t *data);

uint16_t CoincidenceCheck(char *str1,char *str2,uint16_t num);

void ADC_init(void);

void delay_ms(int msec);



#endif /* REMOTEHAND_H_ */





//使うかもしれない関数
/*ADC*/
//ADC_GetConversionValue	Oneshot
//ADC_ChannelConfig
//ADC_OverrunModeCmd	Disable
//ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
