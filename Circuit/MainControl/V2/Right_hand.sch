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
Sheet 4 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4700 2850 4700 3350
$Comp
L +3.3V #PWR028
U 1 1 599EFCD1
P 4700 2650
F 0 "#PWR028" H 4700 2500 50  0001 C CNN
F 1 "+3.3V" H 4700 2790 50  0000 C CNN
F 2 "" H 4700 2650 50  0000 C CNN
F 3 "" H 4700 2650 50  0000 C CNN
	1    4700 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 593BE5B7
P 4700 3350
F 0 "#PWR029" H 4700 3100 50  0001 C CNN
F 1 "GND" H 4700 3200 50  0000 C CNN
F 2 "" H 4700 3350 50  0000 C CNN
F 3 "" H 4700 3350 50  0000 C CNN
	1    4700 3350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR030
U 1 1 593BE60D
P 4950 2550
F 0 "#PWR030" H 4950 2400 50  0001 C CNN
F 1 "+3.3V" H 4950 2690 50  0000 C CNN
F 2 "" H 4950 2550 50  0000 C CNN
F 3 "" H 4950 2550 50  0000 C CNN
	1    4950 2550
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 593BE613
P 4950 2750
F 0 "R8" V 5030 2750 50  0000 C CNN
F 1 "10k" V 4950 2750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4880 2750 50  0001 C CNN
F 3 "" H 4950 2750 50  0000 C CNN
	1    4950 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2600 4950 2550
Text HLabel 5150 2950 2    60   Output ~ 0
Joy_X
Wire Wire Line
	4650 2950 5150 2950
Wire Wire Line
	4650 2750 4700 2750
Wire Wire Line
	4700 2750 4700 2650
$Comp
L CONN_01X05 J1
U 1 1 599EFCD5
P 4450 2950
F 0 "J1" H 4450 3250 50  0000 C CNN
F 1 "R_Hand" V 4550 2950 50  0000 C CNN
F 2 "YASU:XA_5Pin_LP" H 4450 2950 50  0001 C CNN
F 3 "" H 4450 2950 50  0001 C CNN
	1    4450 2950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4650 2850 4700 2850
Wire Wire Line
	4650 3050 5150 3050
Wire Wire Line
	4650 3150 5150 3150
Text HLabel 5150 3050 2    60   Output ~ 0
Joy_Y
Text HLabel 5150 3150 2    60   Output ~ 0
SW
Wire Wire Line
	4950 2900 4950 3150
Connection ~ 4950 3150
$EndSCHEMATC
