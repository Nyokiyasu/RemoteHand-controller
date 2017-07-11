/*
 * main.h
 *
 *  Created on: 2017/07/01
 *      Author: Yasu
 */

#ifndef REMOTEHAND_H_
#define REMOTEHAND_H_

#include "stm32f0xx.h"

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

/*プロトタイプ宣言 ==================================================== */
/*DIO関係*/
void DipSW_init(void);
uint8_t DipSW_read(void);
void Switches_init(void);
/*USART関係*/
void Bluetooth_init(char* command);
void IM315RTX_init(void);
void IM315RTX_PutBytes(char* str,uint16_t num);
void USART_PutString(USART_TypeDef* USARTx,char* str);
uint16_t USART_GetString(USART_TypeDef* USARTx,char* buff,uint16_t max);
uint16_t coincidenceCheck(char *str1,char *str2,uint16_t num);

/*構造体定義 ==================================================== */
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
/* リングバッファ関係 */
typedef struct
{
	/* ポインタ */
	volatile int recvPtr_in;
	volatile int recvPtr_out;
	/* バッファ */
	uint8_t buff[RECV_RINGBUFF_SIZE];
} ringBuffer_t;

/*グローバル変数 ==================================================== */
static ringBuffer_t bluetooth_buffer, modular_buffer;

#endif /* REMOTEHAND_H_ */





//使うかもしれない関数
/*USART*/
//	USART_ClockStructInit(&init_usartclock);
//	USART_ClockInit(USART2,init_usartclock);
