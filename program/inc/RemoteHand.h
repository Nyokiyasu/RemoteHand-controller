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
#define CONNECTCOMMAND7

#define RECV_RINGBUFF_SIZE 16
#define IM315TRX_RECV_TIMEOUT_MS 500
#define IM315TRX_SEND_TIMEOUT_MS 500
#define BLUETOOTH_RECV_TIMEOUT_MS 500

//RとＬは暫定
#define R_SHOULDER_NUM	2
#define R_ELBOW_NUM		3
#define R_WRIST_NUM		4
#define L_SHOULDER_NUM	5
#define L_ELBOW_NUM		6
#define L_WRIST_NUM		7
#define	JOY_X_NUM		0
#define JOY_Y_NUM		1


#define SystemTimer_ms_Check()		(gSystemTimer_ms)
#define Check_Busy()	(GPIO_ReadOutputDataBit(GPIOB,GPIO_Pin_4))
#define Check_ccw()		(GPIO_ReadOutputDataBit(GPIOA,GPIO_Pin_9))
#define Check_cw()		(GPIO_ReadOutputDataBit(GPIOA,GPIO_Pin_8))
#define Check_wall()	(GPIO_ReadOutputDataBit(GPIOF,GPIO_Pin_0))
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
			uint8_t EmSW		:4;
			uint8_t Reserved 	:1;
			uint8_t Wall		:1;
			uint8_t CCW			:1;
			uint8_t CW			:1;
		} Sepalate;
		struct {
			uint8_t Lower	:4;
			uint8_t Higher	:4;
		} HalfBytes[8];
		uint8_t Bytes[8];
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

char FourBit2Ascii[] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};

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
/*ADC*/
void ADC_init(void);
/*Timer*/
void delay_ms(int msec);
/*SensorData*/
void GetSensorData(RHC_t *data);
void Conv4Bit2Ascii(RHC_t *data);
uint8_t Check_EmSW(void);



#endif /* REMOTEHAND_H_ */





//使うかもしれない関数
/*ADC*/
//ADC_GetConversionValue	Oneshot

