/**
  ******************************************************************************
  * @file    main.c
  * @author  Ac6
  * @version V1.0
  * @date    01-December-2013
  * @brief   Default main function.
  ******************************************************************************
*/


#include "RemoteHand.h"
//#define PC_Debug
//#define Studio_Debug
#define Main

/*�O���[�o���ϐ� ==================================================== */
#ifdef Studio_Debug
RHC_t studio;
uint8_t R_Enable;
uint8_t L_Enable;
uint8_t Joyx;
uint8_t Joyy;
uint8_t Rot;
#endif
#ifdef PCDebug
int sendcounter;
#endif

int main(void)
{
	/*�ϐ���`*/
	uint8_t mode;
	RHC_t data;

	/*���C���N���b�N��8MHz����48MHz�֕ύX*/
	RCC_PLLConfig(RCC_PLLSource_HSI_Div2,RCC_PLLMul_12);
	RCC_PLLCmd(ENABLE);
	RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);

	/*�������֐��Q*/

	DipSW_init();
	Switches_init();
	ADCPort_init();
	SysTick_Config(48000);	//systickTimer��1ms�ɐݒ�
//	IM315TRX_USART_init();
	Bluetooth_USART_init();

	mode = DipSW_read();

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
		//DipSW��7��������Bluetooth�̏��������X�L�b�v����
		//�f�o�b�O�p
		break;
		}

	while(1)
	{
		if(!Check_EmSW())	GetSensorData(&data);
		else
		{
			data.SensorData.Sepalate.Joy_X = STATIC_JOYPOS;
			data.SensorData.Sepalate.Joy_Y = STATIC_JOYPOS;
			data.SensorData.Sepalate.Rotation = STATIC_JOYPOS;
			data.SensorData.Sepalate.LSW = DISABLE;
			data.SensorData.Sepalate.RSW = DISABLE;
		}
		Conv4Bit2Ascii(&data);
#ifdef PC_Debug
		for (sendcounter=0;sendcounter<16;sendcounter++)
		{
			Bluetooth_SendByte(data.SendData[sendcounter]);
			if(sendcounter%2)Bluetooth_SendByte(',');
		}
		Bluetooth_SendString("\r\n");
#endif
#ifdef	studio_Debug
		studio = data;
		Rot	= data.SensorData.Sepalate.Rotation;
		Joyx = data.SensorData.Sepalate.Joy_X;
		Joyy = data.SensorData.Sepalate.Joy_Y;
		R_Enable = Check_LSW;;
		L_Enable = Check_LSW;
#endif

		Bluetooth_SendRHCFrame(&data);
//		IM315TRX_SendRHCFrame(&data);

	}

}
