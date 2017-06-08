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
Sheet 2 3
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
L CONN_01X06 P17
U 1 1 58DA469F
P 3800 2850
F 0 "P17" H 3800 3200 50  0000 C CNN
F 1 "CONN_01X06" V 3900 2850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 3800 2850 50  0001 C CNN
F 3 "" H 3800 2850 50  0000 C CNN
	1    3800 2850
	1    0    0    -1  
$EndComp
NoConn ~ 3600 2600
Wire Wire Line
	3400 2700 3600 2700
Wire Wire Line
	3400 2900 3600 2900
Wire Wire Line
	3600 2800 3500 2800
Wire Wire Line
	3500 2800 3500 3200
Wire Wire Line
	3600 3000 3400 3000
Wire Wire Line
	3600 3100 3400 3100
$Comp
L GND #PWR031
U 1 1 58DA69EB
P 3500 3200
F 0 "#PWR031" H 3500 2950 50  0001 C CNN
F 1 "GND" H 3500 3050 50  0000 C CNN
F 2 "" H 3500 3200 50  0000 C CNN
F 3 "" H 3500 3200 50  0000 C CNN
	1    3500 3200
	1    0    0    -1  
$EndComp
Text HLabel 3400 2700 0    60   Output ~ 0
SWCLK
Text HLabel 3400 2900 0    60   Output ~ 0
SWDIO
Text HLabel 3400 3000 0    60   Output ~ 0
NRST
Text HLabel 3400 3100 0    60   Output ~ 0
SWO
$EndSCHEMATC
