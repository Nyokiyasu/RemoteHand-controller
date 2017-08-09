EESchema Schematic File Version 2
LIBS:power
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:YASU
LIBS:device
LIBS:rhand_controller-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 6150 1000 700  600 
U 5936B59F
F0 "ST-LINK" 60
F1 "ST-LINK.sch" 60
F2 "SWCLK" O R 6850 1150 60 
F3 "SWDIO" O R 6850 1250 60 
F4 "NRST" O R 6850 1350 60 
F5 "SWO" O R 6850 1450 60 
$EndSheet
$Sheet
S 8100 1450 550  300 
U 5936B5DF
F0 "Make_3.3V" 60
F1 "Make_3.3V.sch" 60
F2 "VDD" I L 8100 1600 60 
$EndSheet
$Comp
L STM32F042 U2
U 1 1 5936B864
P 6600 5900
F 0 "U2" H 7200 5800 60  0000 C CNN
F 1 "STM32F042" H 7200 5950 60  0000 C CNN
F 2 "Housings_QFP:LQFP-32_7x7mm_Pitch0.8mm" H 7150 5800 60  0001 C CNN
F 3 "" H 7150 5800 60  0000 C CNN
	1    6600 5900
	1    0    0    -1  
$EndComp
$Comp
L BLUETOOTH P1
U 1 1 5936B91F
P 4350 1400
F 0 "P1" H 4350 1800 60  0000 C CNN
F 1 "BLUETOOTH" H 4350 1200 60  0000 C CNN
F 2 "robocon_pcb:ESD200" H 4350 1400 60  0001 C CNN
F 3 "" H 4350 1400 60  0000 C CNN
	1    4350 1400
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 5936C28B
P 7050 3600
F 0 "#PWR01" H 7050 3450 50  0001 C CNN
F 1 "+3.3V" H 7050 3740 50  0000 C CNN
F 2 "" H 7050 3600 50  0000 C CNN
F 3 "" H 7050 3600 50  0000 C CNN
	1    7050 3600
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5936C50E
P 7050 4100
F 0 "C2" H 7075 4200 50  0000 L CNN
F 1 "0.1u" H 7075 4000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7088 3950 50  0001 C CNN
F 3 "" H 7050 4100 50  0000 C CNN
	1    7050 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5936C56B
P 7050 4400
F 0 "#PWR02" H 7050 4150 50  0001 C CNN
F 1 "GND" H 7050 4250 50  0000 C CNN
F 2 "" H 7050 4400 50  0000 C CNN
F 3 "" H 7050 4400 50  0000 C CNN
	1    7050 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5936C947
P 6600 6650
F 0 "#PWR03" H 6600 6400 50  0001 C CNN
F 1 "GND" H 6600 6500 50  0000 C CNN
F 2 "" H 6600 6650 50  0000 C CNN
F 3 "" H 6600 6650 50  0000 C CNN
	1    6600 6650
	1    0    0    -1  
$EndComp
Text Label 7200 1150 2    60   ~ 0
SWCLK
Text Label 7200 1250 2    60   ~ 0
SWDIO
Text Label 7200 1350 2    60   ~ 0
NRST
Text Label 7200 1450 2    60   ~ 0
SWO
$Comp
L GND #PWR04
U 1 1 5936E290
P 10550 5500
F 0 "#PWR04" H 10550 5250 50  0001 C CNN
F 1 "GND" H 10550 5350 50  0000 C CNN
F 2 "" H 10550 5500 50  0000 C CNN
F 3 "" H 10550 5500 50  0000 C CNN
	1    10550 5500
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5936E3FC
P 10300 5400
F 0 "R6" V 10380 5400 50  0000 C CNN
F 1 "10k" V 10300 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 10230 5400 50  0001 C CNN
F 3 "" H 10300 5400 50  0000 C CNN
	1    10300 5400
	0    1    1    0   
$EndComp
Text Label 10250 6050 2    60   ~ 0
NRST
Text Label 10400 4900 2    60   ~ 0
SWO
Text Label 2850 6000 0    60   ~ 0
SWDIO
Text Label 2850 6100 0    60   ~ 0
SWCLK
Text Label 2650 5000 0    60   ~ 0
Blutooth_TXD
Text Label 2650 4900 0    60   ~ 0
Blutooth_RXD
Text Label 3200 1150 0    60   ~ 0
Blutooth_RXD
Text Label 3200 1250 0    60   ~ 0
Blutooth_TXD
$Comp
L GND #PWR05
U 1 1 59370187
P 3850 1550
F 0 "#PWR05" H 3850 1300 50  0001 C CNN
F 1 "GND" H 3850 1400 50  0000 C CNN
F 2 "" H 3850 1550 50  0000 C CNN
F 3 "" H 3850 1550 50  0000 C CNN
	1    3850 1550
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 593703DB
P 5000 1050
F 0 "#PWR06" H 5000 900 50  0001 C CNN
F 1 "+3.3V" H 5000 1190 50  0000 C CNN
F 2 "" H 5000 1050 50  0000 C CNN
F 3 "" H 5000 1050 50  0000 C CNN
	1    5000 1050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 59370516
P 5450 1450
F 0 "#PWR07" H 5450 1200 50  0001 C CNN
F 1 "GND" H 5450 1300 50  0000 C CNN
F 2 "" H 5450 1450 50  0000 C CNN
F 3 "" H 5450 1450 50  0000 C CNN
	1    5450 1450
	1    0    0    -1  
$EndComp
Text Label 10650 5200 2    60   ~ 0
315MHz_RXD
Text Label 10650 5300 2    60   ~ 0
315MHz_TXD
Text Label 2850 5700 0    60   ~ 0
DSW_B0
Text Label 2850 5800 0    60   ~ 0
DSW_B1
Text Label 2850 5900 0    60   ~ 0
DSW_B2
$Comp
L C C1
U 1 1 5937C110
P 5150 1300
F 0 "C1" H 5175 1400 50  0000 L CNN
F 1 "0.1u" H 5175 1200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5188 1150 50  0001 C CNN
F 3 "" H 5150 1300 50  0000 C CNN
	1    5150 1300
	1    0    0    -1  
$EndComp
Text Label 2950 5100 0    60   ~ 0
LeftU
Text Label 2950 5200 0    60   ~ 0
LeftV
Text Label 2950 5300 0    60   ~ 0
LeftW
Wire Wire Line
	6000 3900 6000 4400
Wire Wire Line
	6000 3900 7050 3900
Wire Wire Line
	6750 3900 6750 4400
Wire Wire Line
	6300 3900 6300 4400
Connection ~ 6300 3900
Connection ~ 6750 3900
Wire Wire Line
	7050 3600 7050 3950
Connection ~ 7050 3900
Wire Wire Line
	7050 4250 7050 4400
Wire Wire Line
	6450 6500 6450 6550
Wire Wire Line
	6450 6550 6750 6550
Wire Wire Line
	6750 6550 6750 6500
Wire Wire Line
	6600 6650 6600 6550
Connection ~ 6600 6550
Wire Wire Line
	7200 1450 6850 1450
Wire Wire Line
	7200 1350 6850 1350
Wire Wire Line
	7200 1250 6850 1250
Wire Wire Line
	7200 1150 6850 1150
Wire Wire Line
	10150 5400 10000 5400
Wire Wire Line
	10550 5500 10550 5400
Wire Wire Line
	10550 5400 10450 5400
Wire Wire Line
	10250 6050 10000 6050
Wire Wire Line
	10000 4900 10400 4900
Wire Wire Line
	2850 6000 3250 6000
Wire Wire Line
	3250 6100 2850 6100
Wire Wire Line
	8100 1600 7900 1600
Wire Wire Line
	7900 1600 7900 1500
Wire Wire Line
	3250 4900 2650 4900
Wire Wire Line
	3250 5000 2650 5000
Wire Wire Line
	3200 1150 3850 1150
Wire Wire Line
	3200 1250 3850 1250
Wire Wire Line
	3850 1450 3850 1550
Wire Wire Line
	4900 1250 5000 1250
Wire Wire Line
	4900 1450 5150 1450
Connection ~ 5000 1250
Wire Wire Line
	4900 1150 5450 1150
Wire Wire Line
	10650 5200 10000 5200
Wire Wire Line
	10650 5300 10000 5300
Wire Wire Line
	1350 5700 3250 5700
Wire Wire Line
	1350 5800 3250 5800
Wire Wire Line
	1350 5900 3250 5900
Wire Wire Line
	2950 5100 3250 5100
Wire Wire Line
	2950 5200 3250 5200
Wire Wire Line
	2950 5300 3250 5300
Text Label 2900 5400 0    60   ~ 0
RightU
Text Label 10400 4700 2    60   ~ 0
RightV
Text Label 10400 4800 2    60   ~ 0
RightW
Wire Wire Line
	10000 4700 10400 4700
Wire Wire Line
	10400 4800 10000 4800
Wire Wire Line
	2900 5400 3250 5400
$Comp
L +7.4V #PWR08
U 1 1 59384263
P 10300 1200
F 0 "#PWR08" H 10300 1050 50  0001 C CNN
F 1 "+7.4V" H 10300 1340 50  0000 C CNN
F 2 "" H 10300 1200 50  0001 C CNN
F 3 "" H 10300 1200 50  0001 C CNN
	1    10300 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 1200 10300 1300
$Comp
L GND #PWR09
U 1 1 593848DF
P 10400 2850
F 0 "#PWR09" H 10400 2600 50  0001 C CNN
F 1 "GND" H 10400 2700 50  0000 C CNN
F 2 "" H 10400 2850 50  0001 C CNN
F 3 "" H 10400 2850 50  0001 C CNN
	1    10400 2850
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG010
U 1 1 59384943
P 10650 1200
F 0 "#FLG010" H 10650 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 10650 1350 50  0000 C CNN
F 2 "" H 10650 1200 50  0001 C CNN
F 3 "" H 10650 1200 50  0001 C CNN
	1    10650 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 1250 10650 1250
Wire Wire Line
	10650 1250 10650 1200
Connection ~ 10300 1250
Wire Wire Line
	10750 2800 10750 2850
$Comp
L PWR_FLAG #FLG011
U 1 1 59384B48
P 10750 2850
F 0 "#FLG011" H 10750 2925 50  0001 C CNN
F 1 "PWR_FLAG" H 10750 3000 50  0000 C CNN
F 2 "" H 10750 2850 50  0001 C CNN
F 3 "" H 10750 2850 50  0001 C CNN
	1    10750 2850
	-1   0    0    1   
$EndComp
$Comp
L +7.4V #PWR012
U 1 1 5938507B
P 7900 1500
F 0 "#PWR012" H 7900 1350 50  0001 C CNN
F 1 "+7.4V" H 7900 1640 50  0000 C CNN
F 2 "" H 7900 1500 50  0001 C CNN
F 3 "" H 7900 1500 50  0001 C CNN
	1    7900 1500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR013
U 1 1 5938AB88
P 2200 1300
F 0 "#PWR013" H 2200 1150 50  0001 C CNN
F 1 "+3.3V" H 2200 1440 50  0000 C CNN
F 2 "" H 2200 1300 50  0000 C CNN
F 3 "" H 2200 1300 50  0000 C CNN
	1    2200 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1300 2200 1350
Wire Wire Line
	2200 3450 2200 3500
$Comp
L GND #PWR014
U 1 1 5938B2E2
P 2200 3500
F 0 "#PWR014" H 2200 3250 50  0001 C CNN
F 1 "GND" H 2200 3350 50  0000 C CNN
F 2 "" H 2200 3500 50  0000 C CNN
F 3 "" H 2200 3500 50  0000 C CNN
	1    2200 3500
	1    0    0    -1  
$EndComp
Text Label 800  2150 0    60   ~ 0
315MHz_RXD
Text Label 800  2250 0    60   ~ 0
315MHz_TXD
Wire Wire Line
	800  2150 1450 2150
Wire Wire Line
	1450 2250 800  2250
NoConn ~ 1450 1750
NoConn ~ 1450 1850
NoConn ~ 1450 1950
NoConn ~ 1450 2050
NoConn ~ 1450 2350
$Comp
L R R5
U 1 1 5938D995
P 3600 2700
F 0 "R5" V 3680 2700 50  0000 C CNN
F 1 "1k" V 3600 2700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3530 2700 50  0001 C CNN
F 3 "" H 3600 2700 50  0001 C CNN
	1    3600 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3250 3600 3350
$Comp
L GND #PWR015
U 1 1 5938DB33
P 3600 3350
F 0 "#PWR015" H 3600 3100 50  0001 C CNN
F 1 "GND" H 3600 3200 50  0000 C CNN
F 2 "" H 3600 3350 50  0001 C CNN
F 3 "" H 3600 3350 50  0001 C CNN
	1    3600 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1700 3050 1700
Wire Wire Line
	3050 1700 3050 1650
$Comp
L +3.3V #PWR016
U 1 1 5938E5AC
P 3050 1650
F 0 "#PWR016" H 3050 1500 50  0001 C CNN
F 1 "+3.3V" H 3050 1790 50  0000 C CNN
F 2 "" H 3050 1650 50  0000 C CNN
F 3 "" H 3050 1650 50  0000 C CNN
	1    3050 1650
	1    0    0    -1  
$EndComp
Text Label 3400 2650 2    60   ~ 0
reset315
Wire Wire Line
	3400 2650 2950 2650
$Comp
L GND #PWR017
U 1 1 5938FDF2
P 3050 1950
F 0 "#PWR017" H 3050 1700 50  0001 C CNN
F 1 "GND" H 3200 1850 50  0000 C CNN
F 2 "" H 3050 1950 50  0000 C CNN
F 3 "" H 3050 1950 50  0000 C CNN
	1    3050 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1800 3050 1800
Wire Wire Line
	3050 1800 3050 1950
Text Label 800  1650 0    60   ~ 0
busy
Wire Wire Line
	800  1650 1450 1650
Text Label 10450 5000 2    60   ~ 0
busy
Text Label 10450 5100 2    60   ~ 0
reset315
Wire Wire Line
	10450 5100 10000 5100
Wire Wire Line
	10000 5000 10450 5000
Text Label 2850 4800 0    60   ~ 0
Joy_Y
Text Label 2850 4700 0    60   ~ 0
Joy_X
Wire Wire Line
	2250 4700 3250 4700
Wire Wire Line
	2250 4800 3250 4800
$Comp
L SW_PUSH SW1
U 1 1 59392826
P 2600 7200
F 0 "SW1" H 2750 7310 50  0000 C CNN
F 1 "EmSW" H 2600 7120 50  0000 C CNN
F 2 "YASU:XA_2Pin" H 2600 7200 50  0001 C CNN
F 3 "" H 2600 7200 50  0000 C CNN
	1    2600 7200
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 5939354D
P 2600 6600
F 0 "R4" V 2680 6600 50  0000 C CNN
F 1 "10k" V 2600 6600 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2530 6600 50  0001 C CNN
F 3 "" H 2600 6600 50  0000 C CNN
	1    2600 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6750 2600 6900
Connection ~ 2600 6850
Wire Wire Line
	2600 6450 2600 6350
Wire Wire Line
	2600 7500 2600 7600
$Comp
L +3.3V #PWR018
U 1 1 59394953
P 2600 6350
F 0 "#PWR018" H 2600 6200 50  0001 C CNN
F 1 "+3.3V" H 2600 6490 50  0000 C CNN
F 2 "" H 2600 6350 50  0000 C CNN
F 3 "" H 2600 6350 50  0000 C CNN
	1    2600 6350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 593949C5
P 2600 7600
F 0 "#PWR019" H 2600 7350 50  0001 C CNN
F 1 "GND" H 2600 7450 50  0000 C CNN
F 2 "" H 2600 7600 50  0000 C CNN
F 3 "" H 2600 7600 50  0000 C CNN
	1    2600 7600
	1    0    0    -1  
$EndComp
$Comp
L SW_DIP_x4 S1
U 1 1 593A8DBA
P 1050 5750
F 0 "S1" H 1050 5500 50  0000 C CNN
F 1 "SW_DIP_x4" H 1050 6000 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_DIP_x4_W7.62mm_Slide" H 1000 5750 50  0001 C CNN
F 3 "" H 1000 5750 50  0000 C CNN
	1    1050 5750
	-1   0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 593A8E23
P 2200 6200
F 0 "R3" V 2280 6200 50  0000 C CNN
F 1 "10k" V 2200 6200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2130 6200 50  0001 C CNN
F 3 "" H 2200 6200 50  0000 C CNN
	1    2200 6200
	-1   0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 593A8EB3
P 2050 6200
F 0 "R2" V 2130 6200 50  0000 C CNN
F 1 "10k" V 2050 6200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1980 6200 50  0001 C CNN
F 3 "" H 2050 6200 50  0000 C CNN
	1    2050 6200
	-1   0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 593A8F2B
P 1900 6200
F 0 "R1" V 1980 6200 50  0000 C CNN
F 1 "10k" V 1900 6200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1830 6200 50  0001 C CNN
F 3 "" H 1900 6200 50  0000 C CNN
	1    1900 6200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1900 5900 1900 5900
Wire Wire Line
	1900 5900 1900 6050
Wire Wire Line
	2050 5800 2050 5800
Wire Wire Line
	2050 5800 2050 6050
Wire Wire Line
	2200 5700 2200 6050
Connection ~ 1900 5900
Connection ~ 2050 5800
Connection ~ 2200 5700
NoConn ~ 1350 5600
NoConn ~ 750  5600
Wire Wire Line
	700  5900 750  5900
Wire Wire Line
	700  5500 700  5900
Wire Wire Line
	750  5700 700  5700
Connection ~ 700  5700
Wire Wire Line
	700  5800 750  5800
Connection ~ 700  5800
Wire Wire Line
	2200 6450 2200 6350
Wire Wire Line
	1900 6450 2200 6450
Wire Wire Line
	1900 6350 1900 6600
Wire Wire Line
	2050 6350 2050 6450
Connection ~ 2050 6450
Connection ~ 1900 6450
$Comp
L GND #PWR020
U 1 1 593ACA34
P 1900 6600
F 0 "#PWR020" H 1900 6350 50  0001 C CNN
F 1 "GND" H 1900 6450 50  0000 C CNN
F 2 "" H 1900 6600 50  0000 C CNN
F 3 "" H 1900 6600 50  0000 C CNN
	1    1900 6600
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR021
U 1 1 593ACE80
P 700 5500
F 0 "#PWR021" H 700 5350 50  0001 C CNN
F 1 "+3.3V" H 700 5640 50  0000 C CNN
F 2 "" H 700 5500 50  0000 C CNN
F 3 "" H 700 5500 50  0000 C CNN
	1    700  5500
	-1   0    0    -1  
$EndComp
Text Label 2950 5500 0    60   ~ 0
CW
Text Label 2950 5600 0    60   ~ 0
CCW
Wire Wire Line
	2750 5500 3250 5500
Wire Wire Line
	2650 5600 3250 5600
$Comp
L SWITCH_INV SW2
U 1 1 593B4934
P 10300 1800
F 0 "SW2" H 10100 1950 50  0000 C CNN
F 1 "SWITCH_INV" H 10150 1650 50  0000 C CNN
F 2 "YASU:_SW_TGR" H 10300 1800 50  0001 C CNN
F 3 "" H 10300 1800 50  0000 C CNN
	1    10300 1800
	0    1    1    0   
$EndComp
NoConn ~ 10200 2300
Text Label 10350 5750 2    60   ~ 0
Wall
Wire Wire Line
	10000 5750 10350 5750
Wire Wire Line
	10000 5850 10350 5850
Text Label 10350 5850 2    60   ~ 0
Enable
Wire Wire Line
	10400 2800 10750 2800
Connection ~ 10400 2800
$Sheet
S 1550 5100 700  300 
U 593BDA75
F0 "LHand" 60
F1 "Left_Hand.sch" 60
F2 "CW" O R 2250 5200 60 
F3 "CCW" O R 2250 5300 60 
F4 "Wall" O L 1550 5300 60 
F5 "Enable" O L 1550 5200 60 
$EndSheet
$Sheet
S 1550 4600 700  300 
U 593D982B
F0 "RHand" 60
F1 "Right_hand.sch" 60
F2 "Joy_X" O R 2250 4700 60 
F3 "Joy_Y" O R 2250 4800 60 
$EndSheet
Wire Wire Line
	2600 6850 3100 6850
Wire Wire Line
	3100 6850 3100 6200
Wire Wire Line
	3100 6200 3250 6200
$Sheet
S 6250 2450 950  400 
U 593EB08A
F0 "Arms" 60
F1 "Arms.sch" 60
F2 "LeftW" O L 6250 2750 60 
F3 "LeftV" O L 6250 2650 60 
F4 "LeftU" O L 6250 2550 60 
F5 "RightU" O R 7200 2550 60 
F6 "RightV" O R 7200 2650 60 
F7 "RightW" O R 7200 2750 60 
$EndSheet
Text Label 5950 2550 0    60   ~ 0
LeftU
Text Label 5950 2650 0    60   ~ 0
LeftV
Text Label 5950 2750 0    60   ~ 0
LeftW
Wire Wire Line
	5950 2550 6250 2550
Wire Wire Line
	5950 2650 6250 2650
Wire Wire Line
	5950 2750 6250 2750
Text Label 7600 2650 2    60   ~ 0
RightV
Text Label 7600 2750 2    60   ~ 0
RightW
Wire Wire Line
	7200 2550 7600 2550
Wire Wire Line
	7200 2650 7600 2650
Wire Wire Line
	7600 2750 7200 2750
Text Label 7600 2550 2    60   ~ 0
RightU
Wire Wire Line
	2250 5200 2750 5200
Wire Wire Line
	2750 5200 2750 5500
Wire Wire Line
	2650 5600 2650 5300
Wire Wire Line
	2650 5300 2250 5300
Text Label 1200 5300 0    60   ~ 0
Wall
Text Label 1200 5200 0    60   ~ 0
Enable
Wire Wire Line
	1200 5300 1550 5300
Wire Wire Line
	1550 5200 1200 5200
Wire Wire Line
	5000 1050 5000 1450
Connection ~ 5000 1450
Wire Wire Line
	5450 1150 5450 1450
Connection ~ 5150 1150
Wire Notes Line
	5600 4000 650  4000
Wire Notes Line
	650  4000 650  800 
Wire Notes Line
	650  800  5600 800 
Wire Notes Line
	5600 800  5600 4000
Text Notes 3400 750  0    60   ~ 0
Communication module
Wire Wire Line
	10400 2700 10400 2850
Wire Wire Line
	10400 2300 10400 2400
$Comp
L IM315TRX U1
U 1 1 59414DD7
P 2200 2400
F 0 "U1" H 1850 3300 60  0000 C CNN
F 1 "IM315TRX" H 2550 3300 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x13_Pitch1.27mm_SMD" H 1775 3175 60  0001 C CNN
F 3 "" H 1775 3175 60  0001 C CNN
	1    2200 2400
	1    0    0    -1  
$EndComp
NoConn ~ 1450 2450
NoConn ~ 1450 2550
NoConn ~ 1450 2650
NoConn ~ 1450 2750
NoConn ~ 1450 2850
NoConn ~ 1450 2950
NoConn ~ 1450 3050
NoConn ~ 1450 3150
Wire Wire Line
	3050 1900 2950 1900
Connection ~ 3050 1900
NoConn ~ 2950 2100
NoConn ~ 2950 2850
$Comp
L Battery_Cell BT1
U 1 1 59423E1E
P 10400 2600
F 0 "BT1" H 10500 2700 50  0000 L CNN
F 1 "Battery_Cell" H 10500 2600 50  0000 L CNN
F 2 "YASU:XT_Mdot" V 10400 2660 50  0001 C CNN
F 3 "" V 10400 2660 50  0001 C CNN
	1    10400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2950 3600 2850
Wire Wire Line
	2950 2450 3600 2450
Wire Wire Line
	3600 2450 3600 2550
$Comp
L LED D1
U 1 1 59426E1D
P 3600 3100
F 0 "D1" H 3600 3200 50  0000 C CNN
F 1 "LED" H 3600 3000 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 3600 3100 50  0001 C CNN
F 3 "" H 3600 3100 50  0001 C CNN
	1    3600 3100
	0    -1   -1   0   
$EndComp
$Comp
L LED D2
U 1 1 59430038
P 9300 1650
F 0 "D2" H 9300 1750 50  0000 C CNN
F 1 "LED" H 9300 1550 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 9300 1650 50  0001 C CNN
F 3 "" H 9300 1650 50  0001 C CNN
	1    9300 1650
	0    -1   -1   0   
$EndComp
$Comp
L R R12
U 1 1 594300EF
P 9300 2050
F 0 "R12" V 9380 2050 50  0000 C CNN
F 1 "1k" V 9300 2050 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9230 2050 50  0001 C CNN
F 3 "" H 9300 2050 50  0001 C CNN
	1    9300 2050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR022
U 1 1 59430560
P 9300 1400
F 0 "#PWR022" H 9300 1250 50  0001 C CNN
F 1 "+3.3V" H 9300 1540 50  0000 C CNN
F 2 "" H 9300 1400 50  0001 C CNN
F 3 "" H 9300 1400 50  0001 C CNN
	1    9300 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 594310C6
P 9300 2300
F 0 "#PWR023" H 9300 2050 50  0001 C CNN
F 1 "GND" H 9300 2150 50  0000 C CNN
F 2 "" H 9300 2300 50  0001 C CNN
F 3 "" H 9300 2300 50  0001 C CNN
	1    9300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2300 9300 2200
Wire Wire Line
	9300 1900 9300 1800
Wire Wire Line
	9300 1500 9300 1400
$EndSCHEMATC