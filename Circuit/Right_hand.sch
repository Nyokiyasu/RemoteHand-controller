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
Sheet 5 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X03 P8
U 1 1 593D9ECA
P 4400 4250
F 0 "P8" H 4400 4450 50  0000 C CNN
F 1 "JoyY" V 4500 4250 50  0000 C CNN
F 2 "YASU:XA_3Pin" H 4400 4250 50  0001 C CNN
F 3 "" H 4400 4250 50  0000 C CNN
	1    4400 4250
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR036
U 1 1 593D9ED1
P 4650 4450
F 0 "#PWR036" H 4650 4200 50  0001 C CNN
F 1 "GND" H 4650 4300 50  0000 C CNN
F 2 "" H 4650 4450 50  0000 C CNN
F 3 "" H 4650 4450 50  0000 C CNN
	1    4650 4450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR037
U 1 1 593D9ED7
P 4650 4050
F 0 "#PWR037" H 4650 3900 50  0001 C CNN
F 1 "+3.3V" H 4650 4190 50  0000 C CNN
F 2 "" H 4650 4050 50  0000 C CNN
F 3 "" H 4650 4050 50  0000 C CNN
	1    4650 4050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P7
U 1 1 593D9EDE
P 4400 3350
F 0 "P7" H 4400 3550 50  0000 C CNN
F 1 "JoyX" V 4500 3350 50  0000 C CNN
F 2 "YASU:XA_3Pin" H 4400 3350 50  0001 C CNN
F 3 "" H 4400 3350 50  0000 C CNN
	1    4400 3350
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR038
U 1 1 593D9EE5
P 4650 3550
F 0 "#PWR038" H 4650 3300 50  0001 C CNN
F 1 "GND" H 4650 3400 50  0000 C CNN
F 2 "" H 4650 3550 50  0000 C CNN
F 3 "" H 4650 3550 50  0000 C CNN
	1    4650 3550
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR039
U 1 1 593D9EEB
P 4650 3150
F 0 "#PWR039" H 4650 3000 50  0001 C CNN
F 1 "+3.3V" H 4650 3290 50  0000 C CNN
F 2 "" H 4650 3150 50  0000 C CNN
F 3 "" H 4650 3150 50  0000 C CNN
	1    4650 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4250 4650 4450
Wire Wire Line
	4650 4150 4650 4050
Text HLabel 4750 3450 2    60   Output ~ 0
Joy_X
Text HLabel 4750 4350 2    60   Output ~ 0
Joy_Y
Wire Wire Line
	4600 3450 4750 3450
Wire Wire Line
	4600 3350 4650 3350
Wire Wire Line
	4650 3350 4650 3550
Wire Wire Line
	4600 3250 4650 3250
Wire Wire Line
	4650 3250 4650 3150
Wire Wire Line
	4600 4150 4650 4150
Wire Wire Line
	4600 4250 4650 4250
Wire Wire Line
	4600 4350 4750 4350
$EndSCHEMATC
