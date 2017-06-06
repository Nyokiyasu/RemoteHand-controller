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
S 10350 5550 700  500 
U 5936B5DF
F0 "Make_3.3V" 60
F1 "Make_3.3V.sch" 60
F2 "VDD" I L 10350 5800 60 
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
P 9900 2800
F 0 "P?" H 9900 3200 60  0000 C CNN
F 1 "BLUETOOTH" H 9900 2600 60  0000 C CNN
F 2 "" H 9900 2800 60  0000 C CNN
F 3 "" H 9900 2800 60  0000 C CNN
	1    9900 2800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5936C28B
P 5250 2900
F 0 "#PWR?" H 5250 2750 50  0001 C CNN
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
L GND #PWR?
U 1 1 5936C56B
P 5250 3700
F 0 "#PWR?" H 5250 3450 50  0001 C CNN
F 1 "GND" H 5250 3550 50  0000 C CNN
F 2 "" H 5250 3700 50  0000 C CNN
F 3 "" H 5250 3700 50  0000 C CNN
	1    5250 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5936C947
P 4800 5950
F 0 "#PWR?" H 4800 5700 50  0001 C CNN
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
L +3.3V #PWR?
U 1 1 5936E1BE
P 9800 4300
F 0 "#PWR?" H 9800 4150 50  0001 C CNN
F 1 "+3.3V" H 9800 4440 50  0000 C CNN
F 2 "" H 9800 4300 50  0000 C CNN
F 3 "" H 9800 4300 50  0000 C CNN
	1    9800 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5936E290
P 8750 4800
F 0 "#PWR?" H 8750 4550 50  0001 C CNN
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
$EndSCHEMATC
