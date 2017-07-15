/*
 * main.h
 *
 *  Created on: 2017/07/01
 *      Author: Yasu
 */

#ifndef REMOTEHAND_H_
#define REMOTEHAND_H_

#include "stm32f0xx.h"

/*ATD+�q������BlueTooth�̃A�h���X���w��*/
#define CONNECTCOMMAND0 "ATD00019508D9CC" /*class1*/
#define CONNECTCOMMAND1 "ATD00019508D9D0" /*class1*/
#define CONNECTCOMMAND2 "ATD00019508D940" /*class1*/
#define CONNECTCOMMAND3 "ATD00019509C3FD" /*class2*/
#define CONNECTCOMMAND4 "ATD00019509C400" /*class2*/
#define CONNECTCOMMAND5 "ATD00019518A0DE" /*class2*/
#define CONNECTCOMMAND6 "ATD00019518A0CD" /*class2*/
#define CONNECTCOMMAND7 "ATD2016D8649BFB" /*�ɓ�PC��Bluetooth�A�h���X*/

#define RECV_RINGBUFF_SIZE 16
#define IM315RTX_RECV_TIMEOUT_MS 500
#define BLUETOOTH_RECV_TIMEOUT_MS 500

#define SystemTimer_ms_Check()		(gSystemTimer_ms)

/*�v���g�^�C�v�錾 ==================================================== */
/*DIO�֌W*/
void DipSW_init(void);
uint8_t DipSW_read(void);
void Switches_init(void);
/*USART�֌W*/
void Bluetooth_USART_init(void);
void Bluetooth_Module_init(char* command);
int Bluetooth_RecvByte(void);
int	Bluetooth_RecvString(char *buf, int max);
void Bluetooth_SendByte(uint8_t byte);
void Bluetooth_SendString(char *str);

void IM315RTX_USART_init(void);
int	IM315RTX_RecvByte(void);
int IM315RTX_RecvString (char *buf, int max);
void IM315RTX_SendByte(uint8_t byte);
void IM315RTX_SendString(char *str);
void IM315RTX_SendFlame(char* str,uint16_t num);

uint16_t CoincidenceCheck(char *str1,char *str2,uint16_t num);

void delay_ms(int msec);

/*�\���̒�` ==================================================== */
typedef union {
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
	}sensor;
	uint8_t bytes[8];
}RHC_t;
/* �����O�o�b�t�@�֌W */
typedef struct
{
	/* �|�C���^ */
	volatile int recvPtr_in;
	volatile int recvPtr_out;
	/* �o�b�t�@ */
	uint8_t buff[RECV_RINGBUFF_SIZE];
} ringBuffer_t;


#endif /* REMOTEHAND_H_ */





//�g����������Ȃ��֐�
/*USART*/
//	USART_ClockStructInit(&init_usartclock);
//	USART_ClockInit(USART2,init_usartclock);
