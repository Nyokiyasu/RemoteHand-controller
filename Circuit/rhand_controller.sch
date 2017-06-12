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
S 3550 1100 700  600 
U 5936B59F
F0 "ST-LINK" 60
F1 "ST-LINK.sch" 60
F2 "SWCLK" O L 3550 1250 60 
F3 "SWDIO" O L 3550 1350 60 
F4 "NRST" O L 3550 1450 60 
F5 "SWO" O L 3550 1550 60 
$EndSheet
$Sheet
S 2050 1100 700  500 
U 5936B5DF
F0 "Make_3.3V" 60
F1 "Make_3.3V.sch" 60
F2 "VDD" I L 2050 1350 60 
$EndSheet
$Comp
L STM32F042 U1
U 1 1 5936B864
P 6600 5900
F 0 "U1" H 7200 5800 60  0000 C CNN
F 1 "STM32F042" H 7200 5950 60  0000 C CNN
F 2 "" H 7150 5800 60  0001 C CNN
F 3 "" H 7150 5800 60  0000 C CNN
	1    6600 5900
	1    0    0    -1  
$EndComp
$Comp
L BLUETOOTH P7
U 1 1 5936B91F
P 9400 1500
F 0 "P7" H 9400 1900 60  0000 C CNN
F 1 "BLUETOOTH" H 9400 1300 60  0000 C CNN
F 2 "" H 9400 1500 60  0001 C CNN
F 3 "" H 9400 1500 60  0000 C CNN
	1    9400 1500
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
L C C1
U 1 1 5936C50E
P 7050 4100
F 0 "C1" H 7075 4200 50  0000 L CNN
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
Text Label 3200 1250 0    60   ~ 0
SWCLK
Text Label 3200 1350 0    60   ~ 0
SWDIO
Text Label 3200 1450 0    60   ~ 0
NRST
Text Label 3200 1550 0    60   ~ 0
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
L R R2
U 1 1 5936E3FC
P 10300 5400
F 0 "R2" V 10380 5400 50  0000 C CNN
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
Text Label 10600 5300 2    60   ~ 0
Blutooth_TXD
Text Label 10600 5200 2    60   ~ 0
Blutooth_RXD
Text Label 8250 1250 0    60   ~ 0
Blutooth_RXD
Text Label 8250 1350 0    60   ~ 0
Blutooth_TXD
$Comp
L GND #PWR05
U 1 1 59370187
P 8900 1650
F 0 "#PWR05" H 8900 1400 50  0001 C CNN
F 1 "GND" H 8900 1500 50  0000 C CNN
F 2 "" H 8900 1650 50  0000 C CNN
F 3 "" H 8900 1650 50  0000 C CNN
	1    8900 1650
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 593703DB
P 10050 1150
F 0 "#PWR06" H 10050 1000 50  0001 C CNN
F 1 "+3.3V" H 10050 1290 50  0000 C CNN
F 2 "" H 10050 1150 50  0000 C CNN
F 3 "" H 10050 1150 50  0000 C CNN
	1    10050 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 59370516
P 10500 1550
F 0 "#PWR07" H 10500 1300 50  0001 C CNN
F 1 "GND" H 10500 1400 50  0000 C CNN
F 2 "" H 10500 1550 50  0000 C CNN
F 3 "" H 10500 1550 50  0000 C CNN
	1    10500 1550
	1    0    0    -1  
$EndComp
Text Label 2600 4900 0    60   ~ 0
315MHz_RXD
Text Label 2600 5000 0    60   ~ 0
315MHz_TXD
Text Label 2850 5700 0    60   ~ 0
DSW_B0
Text Label 2850 5800 0    60   ~ 0
DSW_B1
Text Label 2850 5900 0    60   ~ 0
DSW_B2
$Comp
L C C2
U 1 1 5937C110
P 10200 1400
F 0 "C2" H 10225 1500 50  0000 L CNN
F 1 "0.1u" H 10225 1300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 10238 1250 50  0001 C CNN
F 3 "" H 10200 1400 50  0000 C CNN
	1    10200 1400
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
	3200 1550 3550 1550
Wire Wire Line
	3200 1450 3550 1450
Wire Wire Line
	3200 1350 3550 1350
Wire Wire Line
	3200 1250 3550 1250
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
	2050 1350 1850 1350
Wire Wire Line
	1850 1350 1850 1250
Wire Wire Line
	10000 5200 10600 5200
Wire Wire Line
	10000 5300 10600 5300
Wire Wire Line
	8250 1250 8900 1250
Wire Wire Line
	8250 1350 8900 1350
Wire Wire Line
	8900 1550 8900 1650
Wire Wire Line
	9950 1350 10050 1350
Wire Wire Line
	9950 1550 10200 1550
Connection ~ 10050 1350
Wire Wire Line
	9950 1250 10500 1250
Wire Wire Line
	2600 4900 3250 4900
Wire Wire Line
	2600 5000 3250 5000
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
L Battery BT1
U 1 1 59383F89
P 1150 2150
F 0 "BT1" H 1250 2250 50  0000 L CNN
F 1 "LiPo" H 1250 2150 50  0000 L CNN
F 2 "" V 1150 2210 50  0001 C CNN
F 3 "" V 1150 2210 50  0001 C CNN
	1    1150 2150
	1    0    0    -1  
$EndComp
$Comp
L +7.4V #PWR08
U 1 1 59384263
P 1050 800
F 0 "#PWR08" H 1050 650 50  0001 C CNN
F 1 "+7.4V" H 1050 940 50  0000 C CNN
F 2 "" H 1050 800 50  0001 C CNN
F 3 "" H 1050 800 50  0001 C CNN
	1    1050 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 800  1050 900 
$Comp
L GND #PWR09
U 1 1 593848DF
P 1150 2450
F 0 "#PWR09" H 1150 2200 50  0001 C CNN
F 1 "GND" H 1150 2300 50  0000 C CNN
F 2 "" H 1150 2450 50  0001 C CNN
F 3 "" H 1150 2450 50  0001 C CNN
	1    1150 2450
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG010
U 1 1 59384943
P 1400 800
F 0 "#FLG010" H 1400 875 50  0001 C CNN
F 1 "PWR_FLAG" H 1400 950 50  0000 C CNN
F 2 "" H 1400 800 50  0001 C CNN
F 3 "" H 1400 800 50  0001 C CNN
	1    1400 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 850  1400 850 
Wire Wire Line
	1400 850  1400 800 
Connection ~ 1050 850 
Wire Wire Line
	1500 2400 1500 2450
$Comp
L PWR_FLAG #FLG011
U 1 1 59384B48
P 1500 2450
F 0 "#FLG011" H 1500 2525 50  0001 C CNN
F 1 "PWR_FLAG" H 1500 2600 50  0000 C CNN
F 2 "" H 1500 2450 50  0001 C CNN
F 3 "" H 1500 2450 50  0001 C CNN
	1    1500 2450
	-1   0    0    1   
$EndComp
$Comp
L +7.4V #PWR012
U 1 1 5938507B
P 1850 1250
F 0 "#PWR012" H 1850 1100 50  0001 C CNN
F 1 "+7.4V" H 1850 1390 50  0000 C CNN
F 2 "" H 1850 1250 50  0001 C CNN
F 3 "" H 1850 1250 50  0001 C CNN
	1    1850 1250
	1    0    0    -1  
$EndComp
$Comp
L IM315TX U2
U 1 1 59389911
P 9450 2900
F 0 "U2" H 9100 3400 60  0000 C CNN
F 1 "IM315TX" H 9800 3400 60  0000 C CNN
F 2 "" H 9025 3275 60  0001 C CNN
F 3 "" H 9025 3275 60  0001 C CNN
	1    9450 2900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR013
U 1 1 5938AB88
P 9450 2200
F 0 "#PWR013" H 9450 2050 50  0001 C CNN
F 1 "+3.3V" H 9450 2340 50  0000 C CNN
F 2 "" H 9450 2200 50  0000 C CNN
F 3 "" H 9450 2200 50  0000 C CNN
	1    9450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 2200 9450 2250
Wire Wire Line
	9450 3550 9450 3600
$Comp
L GND #PWR014
U 1 1 5938B2E2
P 9450 3600
F 0 "#PWR014" H 9450 3350 50  0001 C CNN
F 1 "GND" H 9450 3450 50  0000 C CNN
F 2 "" H 9450 3600 50  0000 C CNN
F 3 "" H 9450 3600 50  0000 C CNN
	1    9450 3600
	1    0    0    -1  
$EndComp
Text Label 8050 2650 0    60   ~ 0
315MHz_RXD
Text Label 8050 2750 0    60   ~ 0
315MHz_TXD
Wire Wire Line
	8050 2650 8700 2650
Wire Wire Line
	8700 2750 8050 2750
NoConn ~ 8700 2850
NoConn ~ 8700 2950
NoConn ~ 8700 3050
NoConn ~ 8700 3150
NoConn ~ 8700 3250
$Comp
L LED D1
U 1 1 5938D7FB
P 10850 3150
F 0 "D1" H 10850 3250 50  0000 C CNN
F 1 "LED" H 10850 3050 50  0000 C CNN
F 2 "" H 10850 3150 50  0001 C CNN
F 3 "" H 10850 3150 50  0001 C CNN
	1    10850 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10200 2950 10850 2950
Wire Wire Line
	10850 2950 10850 3000
$Comp
L R R1
U 1 1 5938D995
P 10850 3650
F 0 "R1" V 10930 3650 50  0000 C CNN
F 1 "1k" V 10850 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 10780 3650 50  0001 C CNN
F 3 "" H 10850 3650 50  0001 C CNN
	1    10850 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 3800 10850 3900
$Comp
L GND #PWR015
U 1 1 5938DB33
P 10850 3900
F 0 "#PWR015" H 10850 3650 50  0001 C CNN
F 1 "GND" H 10850 3750 50  0000 C CNN
F 2 "" H 10850 3900 50  0001 C CNN
F 3 "" H 10850 3900 50  0001 C CNN
	1    10850 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 2600 10300 2600
Wire Wire Line
	10300 2600 10300 2550
$Comp
L +3.3V #PWR016
U 1 1 5938E5AC
P 10300 2550
F 0 "#PWR016" H 10300 2400 50  0001 C CNN
F 1 "+3.3V" H 10300 2690 50  0000 C CNN
F 2 "" H 10300 2550 50  0000 C CNN
F 3 "" H 10300 2550 50  0000 C CNN
	1    10300 2550
	1    0    0    -1  
$EndComp
Text Label 10650 3150 2    60   ~ 0
reset315
Wire Wire Line
	10650 3150 10200 3150
$Comp
L GND #PWR017
U 1 1 5938FDF2
P 10300 2750
F 0 "#PWR017" H 10300 2500 50  0001 C CNN
F 1 "GND" H 10300 2600 50  0000 C CNN
F 2 "" H 10300 2750 50  0000 C CNN
F 3 "" H 10300 2750 50  0000 C CNN
	1    10300 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 2700 10300 2700
Wire Wire Line
	10300 2700 10300 2750
Text Label 8050 2550 0    60   ~ 0
busy
Wire Wire Line
	8050 2550 8700 2550
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
F 2 "" H 2600 7200 50  0000 C CNN
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
F 2 "" V 2530 6600 50  0000 C CNN
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
F 2 "" H 1000 5750 50  0000 C CNN
F 3 "" H 1000 5750 50  0000 C CNN
	1    1050 5750
	-1   0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 593A8E23
P 2200 6200
F 0 "R9" V 2280 6200 50  0000 C CNN
F 1 "10k" V 2200 6200 50  0000 C CNN
F 2 "" V 2130 6200 50  0000 C CNN
F 3 "" H 2200 6200 50  0000 C CNN
	1    2200 6200
	-1   0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 593A8EB3
P 2050 6200
F 0 "R10" V 2130 6200 50  0000 C CNN
F 1 "10k" V 2050 6200 50  0000 C CNN
F 2 "" V 1980 6200 50  0000 C CNN
F 3 "" H 2050 6200 50  0000 C CNN
	1    2050 6200
	-1   0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 593A8F2B
P 1900 6200
F 0 "R11" V 1980 6200 50  0000 C CNN
F 1 "10k" V 1900 6200 50  0000 C CNN
F 2 "" V 1830 6200 50  0000 C CNN
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
P 1050 1400
F 0 "SW2" H 850 1550 50  0000 C CNN
F 1 "SWITCH_INV" H 900 1250 50  0000 C CNN
F 2 "" H 1050 1400 50  0000 C CNN
F 3 "" H 1050 1400 50  0000 C CNN
	1    1050 1400
	0    1    1    0   
$EndComp
NoConn ~ 950  1900
Wire Wire Line
	1150 1900 1150 2000
Text Label 10350 5750 2    60   ~ 0
Wall
Wire Wire Line
	10000 5750 10350 5750
Wire Wire Line
	10000 5850 10350 5850
Text Label 10350 5850 2    60   ~ 0
Enable
Wire Wire Line
	1150 2300 1150 2450
Wire Wire Line
	1150 2400 1500 2400
Connection ~ 1150 2400
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
S 1500 3950 950  400 
U 593EB08A
F0 "Arms" 60
F1 "Arms.sch" 60
F2 "LeftW" O L 1500 4250 60 
F3 "LeftV" O L 1500 4150 60 
F4 "LeftU" O L 1500 4050 60 
F5 "RightU" O R 2450 4050 60 
F6 "RightV" O R 2450 4150 60 
F7 "RightW" O R 2450 4250 60 
$EndSheet
Text Label 1200 4050 0    60   ~ 0
LeftU
Text Label 1200 4150 0    60   ~ 0
LeftV
Text Label 1200 4250 0    60   ~ 0
LeftW
Wire Wire Line
	1200 4050 1500 4050
Wire Wire Line
	1200 4150 1500 4150
Wire Wire Line
	1200 4250 1500 4250
Text Label 2850 4050 2    60   ~ 0
RightV
Text Label 2850 4150 2    60   ~ 0
RightW
Wire Wire Line
	2450 4050 2850 4050
Wire Wire Line
	2450 4150 2850 4150
Wire Wire Line
	2850 4250 2450 4250
Text Label 2850 4250 2    60   ~ 0
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
	10050 1150 10050 1550
Connection ~ 10050 1550
Wire Wire Line
	10500 1250 10500 1550
Connection ~ 10200 1250
Wire Notes Line
	11050 4100 7950 4100
Wire Notes Line
	7950 4100 7950 900 
Wire Notes Line
	7950 900  11050 900 
Wire Notes Line
	11050 900  11050 4100
Text Notes 9950 850  0    60   ~ 0
Communication module
Wire Wire Line
	10850 3500 10850 3350
$EndSCHEMATC
