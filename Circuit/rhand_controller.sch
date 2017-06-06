EESchema Schematic File Version 2
LIBS:power
LIBS:device
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
LIBS:robocon_sch
LIBS:YASU
LIBS:rhand_controller-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
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
S 10350 4450 700  600 
U 5936B59F
F0 "ST-LINK" 60
F1 "ST-LINK.sch" 60
F2 "SWCLK" O L 10350 4600 60 
F3 "SWDIO" O L 10350 4700 60 
F4 "NRST" O L 10350 4800 60 
F5 "SWO" O L 10350 4900 60 
$EndSheet
$Sheet
S 10350 5400 700  500 
U 5936B5DF
F0 "Make_3.3V" 60
F1 "Make_3.3V.sch" 60
F2 "VDD" I L 10350 5650 60 
$EndSheet
$Comp
L STM32F042 U?
U 1 1 5936B864
P 4800 5200
F 0 "U?" H 5400 5100 60  0000 C CNN
F 1 "STM32F042" H 5400 5250 60  0000 C CNN
F 2 "" H 5350 5100 60  0000 C CNN
F 3 "" H 5350 5100 60  0000 C CNN
	1    4800 5200
	1    0    0    -1  
$EndComp
$Comp
L BLUETOOTH P?
U 1 1 5936B91F
P 10300 2450
F 0 "P?" H 10300 2850 60  0000 C CNN
F 1 "BLUETOOTH" H 10300 2250 60  0000 C CNN
F 2 "" H 10300 2450 60  0000 C CNN
F 3 "" H 10300 2450 60  0000 C CNN
	1    10300 2450
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 5936C28B
P 5250 2900
F 0 "#PWR01" H 5250 2750 50  0001 C CNN
F 1 "+3.3V" H 5250 3040 50  0000 C CNN
F 2 "" H 5250 2900 50  0000 C CNN
F 3 "" H 5250 2900 50  0000 C CNN
	1    5250 2900
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5936C50E
P 5250 3400
F 0 "C?" H 5275 3500 50  0000 L CNN
F 1 "C" H 5275 3300 50  0000 L CNN
F 2 "" H 5288 3250 50  0000 C CNN
F 3 "" H 5250 3400 50  0000 C CNN
	1    5250 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5936C56B
P 5250 3700
F 0 "#PWR02" H 5250 3450 50  0001 C CNN
F 1 "GND" H 5250 3550 50  0000 C CNN
F 2 "" H 5250 3700 50  0000 C CNN
F 3 "" H 5250 3700 50  0000 C CNN
	1    5250 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5936C947
P 4800 5950
F 0 "#PWR03" H 4800 5700 50  0001 C CNN
F 1 "GND" H 4800 5800 50  0000 C CNN
F 2 "" H 4800 5950 50  0000 C CNN
F 3 "" H 4800 5950 50  0000 C CNN
	1    4800 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3200 4200 3700
Wire Wire Line
	4200 3200 5250 3200
Wire Wire Line
	4950 3200 4950 3700
Wire Wire Line
	4500 3200 4500 3700
Connection ~ 4500 3200
Connection ~ 4950 3200
Wire Wire Line
	5250 2900 5250 3250
Connection ~ 5250 3200
Wire Wire Line
	5250 3550 5250 3700
Wire Wire Line
	4650 5800 4650 5850
Wire Wire Line
	4650 5850 4950 5850
Wire Wire Line
	4950 5850 4950 5800
Wire Wire Line
	4800 5950 4800 5850
Connection ~ 4800 5850
Wire Wire Line
	10000 4900 10350 4900
Wire Wire Line
	9800 4800 10350 4800
Wire Wire Line
	10000 4700 10350 4700
Wire Wire Line
	10000 4600 10350 4600
Text Label 10000 4600 0    60   ~ 0
SWCLK
Text Label 10000 4700 0    60   ~ 0
SWDIO
Text Label 10000 4800 0    60   ~ 0
NRST
Text Label 10000 4900 0    60   ~ 0
SWO
$Comp
L R R?
U 1 1 5936DE36
P 9800 4600
F 0 "R?" V 9880 4600 50  0000 C CNN
F 1 "1k" V 9800 4600 50  0000 C CNN
F 2 "" V 9730 4600 50  0000 C CNN
F 3 "" H 9800 4600 50  0000 C CNN
	1    9800 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4750 9800 4800
Wire Wire Line
	9800 4300 9800 4450
$Comp
L +3.3V #PWR04
U 1 1 5936E1BE
P 9800 4300
F 0 "#PWR04" H 9800 4150 50  0001 C CNN
F 1 "+3.3V" H 9800 4440 50  0000 C CNN
F 2 "" H 9800 4300 50  0000 C CNN
F 3 "" H 9800 4300 50  0000 C CNN
	1    9800 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5936E290
P 8750 4800
F 0 "#PWR05" H 8750 4550 50  0001 C CNN
F 1 "GND" H 8750 4650 50  0000 C CNN
F 2 "" H 8750 4800 50  0000 C CNN
F 3 "" H 8750 4800 50  0000 C CNN
	1    8750 4800
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5936E3FC
P 8500 4700
F 0 "R?" V 8580 4700 50  0000 C CNN
F 1 "10k" V 8500 4700 50  0000 C CNN
F 2 "" V 8430 4700 50  0000 C CNN
F 3 "" H 8500 4700 50  0000 C CNN
	1    8500 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 4700 8200 4700
Wire Wire Line
	8750 4800 8750 4700
Wire Wire Line
	8750 4700 8650 4700
Wire Wire Line
	8450 5350 8200 5350
Text Label 8450 5350 2    60   ~ 0
NRST
Text Label 8450 4200 2    60   ~ 0
SWO
Wire Wire Line
	8200 4200 8450 4200
Text Label 1050 5300 0    60   ~ 0
SWDIO
Text Label 1050 5400 0    60   ~ 0
SWCLK
Wire Wire Line
	1050 5300 1450 5300
Wire Wire Line
	1450 5400 1050 5400
Wire Wire Line
	10350 5650 10150 5650
Wire Wire Line
	10150 5650 10150 5550
$Sheet
S 10300 3450 750  500 
U 5936D453
F0 "RotarySW" 60
F1 "RotarySW.sch" 60
F2 "BIT0" O L 10300 3550 60 
F3 "BIT1" O L 10300 3650 60 
F4 "BIT2" O L 10300 3750 60 
F5 "BIT3" O L 10300 3850 60 
$EndSheet
Wire Wire Line
	9900 3550 10300 3550
Wire Wire Line
	9900 3650 10300 3650
Wire Wire Line
	9900 3750 10300 3750
Wire Wire Line
	9900 3850 10300 3850
Text Label 9900 3550 0    60   ~ 0
RSW_B0
Text Label 9900 3650 0    60   ~ 0
RSW_B1
Text Label 9900 3750 0    60   ~ 0
RSW_B2
Text Label 9900 3850 0    60   ~ 0
RSW_B3
Wire Wire Line
	8200 4500 8800 4500
Wire Wire Line
	8200 4600 8800 4600
Text Label 8800 4600 2    60   ~ 0
Blutooth_TXD
Text Label 8800 4500 2    60   ~ 0
Blutooth_RXD
Text Label 9150 2200 0    60   ~ 0
Blutooth_RXD
Text Label 9150 2300 0    60   ~ 0
Blutooth_TXD
Wire Wire Line
	9150 2200 9800 2200
Wire Wire Line
	9150 2300 9800 2300
Wire Wire Line
	9800 2500 9800 2600
$Comp
L GND #PWR06
U 1 1 59370187
P 9800 2600
F 0 "#PWR06" H 9800 2350 50  0001 C CNN
F 1 "GND" H 9800 2450 50  0000 C CNN
F 2 "" H 9800 2600 50  0000 C CNN
F 3 "" H 9800 2600 50  0000 C CNN
	1    9800 2600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR07
U 1 1 593703DB
P 10950 2100
F 0 "#PWR07" H 10950 1950 50  0001 C CNN
F 1 "+3.3V" H 10950 2240 50  0000 C CNN
F 2 "" H 10950 2100 50  0000 C CNN
F 3 "" H 10950 2100 50  0000 C CNN
	1    10950 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 2300 10950 2300
Wire Wire Line
	10950 2100 10950 2550
Wire Wire Line
	10950 2500 10850 2500
Connection ~ 10950 2300
Wire Wire Line
	10850 2200 11100 2200
Wire Wire Line
	11100 2200 11100 3000
$Comp
L GND #PWR08
U 1 1 59370516
P 11100 3000
F 0 "#PWR08" H 11100 2750 50  0001 C CNN
F 1 "GND" H 11100 2850 50  0000 C CNN
F 2 "" H 11100 3000 50  0000 C CNN
F 3 "" H 11100 3000 50  0000 C CNN
	1    11100 3000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P?
U 1 1 593711C9
P 2500 2200
F 0 "P?" H 2500 2400 50  0000 C CNN
F 1 "V_ADC" V 2600 2200 50  0000 C CNN
F 2 "" H 2500 2200 50  0000 C CNN
F 3 "" H 2500 2200 50  0000 C CNN
	1    2500 2200
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P?
U 1 1 59371792
P 3200 2200
F 0 "P?" H 3200 2400 50  0000 C CNN
F 1 "W_ADC" V 3300 2200 50  0000 C CNN
F 2 "" H 3200 2200 50  0000 C CNN
F 3 "" H 3200 2200 50  0000 C CNN
	1    3200 2200
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P?
U 1 1 593717F9
P 1900 2200
F 0 "P?" H 1900 2400 50  0000 C CNN
F 1 "U_ADC" V 2000 2200 50  0000 C CNN
F 2 "" H 1900 2200 50  0000 C CNN
F 3 "" H 1900 2200 50  0000 C CNN
	1    1900 2200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR09
U 1 1 593718F7
P 2100 2350
F 0 "#PWR09" H 2100 2100 50  0001 C CNN
F 1 "GND" H 2100 2200 50  0000 C CNN
F 2 "" H 2100 2350 50  0000 C CNN
F 3 "" H 2100 2350 50  0000 C CNN
	1    2100 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 59371957
P 2700 2350
F 0 "#PWR010" H 2700 2100 50  0001 C CNN
F 1 "GND" H 2700 2200 50  0000 C CNN
F 2 "" H 2700 2350 50  0000 C CNN
F 3 "" H 2700 2350 50  0000 C CNN
	1    2700 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 593719B0
P 3400 2350
F 0 "#PWR011" H 3400 2100 50  0001 C CNN
F 1 "GND" H 3400 2200 50  0000 C CNN
F 2 "" H 3400 2350 50  0000 C CNN
F 3 "" H 3400 2350 50  0000 C CNN
	1    3400 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2300 3400 2350
Wire Wire Line
	2700 2350 2700 2300
Wire Wire Line
	2100 2350 2100 2300
$Comp
L +3.3V #PWR012
U 1 1 5937205F
P 3400 2050
F 0 "#PWR012" H 3400 1900 50  0001 C CNN
F 1 "+3.3V" H 3400 2190 50  0000 C CNN
F 2 "" H 3400 2050 50  0000 C CNN
F 3 "" H 3400 2050 50  0000 C CNN
	1    3400 2050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR013
U 1 1 593720BF
P 2700 2050
F 0 "#PWR013" H 2700 1900 50  0001 C CNN
F 1 "+3.3V" H 2700 2190 50  0000 C CNN
F 2 "" H 2700 2050 50  0000 C CNN
F 3 "" H 2700 2050 50  0000 C CNN
	1    2700 2050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR014
U 1 1 59372118
P 2100 2050
F 0 "#PWR014" H 2100 1900 50  0001 C CNN
F 1 "+3.3V" H 2100 2190 50  0000 C CNN
F 2 "" H 2100 2050 50  0000 C CNN
F 3 "" H 2100 2050 50  0000 C CNN
	1    2100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2050 2100 2100
Wire Wire Line
	2700 2100 2700 2050
Wire Wire Line
	3400 2100 3400 2050
Wire Wire Line
	3400 2200 3600 2200
Wire Wire Line
	2700 2200 2900 2200
Text Label 3600 2200 2    60   ~ 0
W
Text Label 2900 2200 2    60   ~ 0
V
Text Label 2250 2200 2    60   ~ 0
U
Wire Wire Line
	2250 2200 2100 2200
Text Label 800  4200 0    60   ~ 0
315MHz_RXD
Wire Wire Line
	800  4200 1450 4200
Text Label 800  4300 0    60   ~ 0
315MHz_TXD
Wire Wire Line
	800  4300 1450 4300
Wire Wire Line
	1050 4700 1450 4700
Wire Wire Line
	1050 4800 1450 4800
Wire Wire Line
	1050 4900 1450 4900
Wire Wire Line
	1050 5000 1450 5000
Text Label 1050 4700 0    60   ~ 0
RSW_B0
Text Label 1050 4800 0    60   ~ 0
RSW_B1
Text Label 1050 4900 0    60   ~ 0
RSW_B2
Text Label 1050 5000 0    60   ~ 0
RSW_B3
Text Label 1250 4400 0    60   ~ 0
U
Text Label 1250 4500 0    60   ~ 0
V
Text Label 1250 4600 0    60   ~ 0
W
Wire Wire Line
	1250 4400 1450 4400
Wire Wire Line
	1450 4500 1250 4500
Wire Wire Line
	1250 4600 1450 4600
$Comp
L C C?
U 1 1 5937C110
P 10950 2700
F 0 "C?" H 10975 2800 50  0000 L CNN
F 1 "C" H 10975 2600 50  0000 L CNN
F 2 "" H 10988 2550 50  0000 C CNN
F 3 "" H 10950 2700 50  0000 C CNN
	1    10950 2700
	1    0    0    -1  
$EndComp
Connection ~ 10950 2500
Wire Wire Line
	10950 2850 11100 2850
Connection ~ 11100 2850
$EndSCHEMATC
