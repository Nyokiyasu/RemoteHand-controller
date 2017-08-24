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
Sheet 6 6
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
L CONN_01X03 P13
U 1 1 593EB2B2
P 4850 4450
F 0 "P13" H 4850 4650 50  0000 C CNN
F 1 "RV_ADC" V 4950 4450 50  0000 C CNN
F 2 "YASU:XA_3Pin" H 4850 4450 50  0001 C CNN
F 3 "" H 4850 4450 50  0000 C CNN
	1    4850 4450
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 P14
U 1 1 593EB2B9
P 4850 5200
F 0 "P14" H 4850 5400 50  0000 C CNN
F 1 "RW_ADC" V 4950 5200 50  0000 C CNN
F 2 "YASU:XA_3Pin" H 4850 5200 50  0001 C CNN
F 3 "" H 4850 5200 50  0000 C CNN
	1    4850 5200
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 P12
U 1 1 593EB2C0
P 4850 3700
F 0 "P12" H 4850 3900 50  0000 C CNN
F 1 "RU_ADC" V 4950 3700 50  0000 C CNN
F 2 "YASU:XA_3Pin" H 4850 3700 50  0001 C CNN
F 3 "" H 4850 3700 50  0000 C CNN
	1    4850 3700
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 593EB2C7
P 5100 3900
F 0 "#PWR040" H 5100 3650 50  0001 C CNN
F 1 "GND" H 5100 3750 50  0000 C CNN
F 2 "" H 5100 3900 50  0000 C CNN
F 3 "" H 5100 3900 50  0000 C CNN
	1    5100 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR041
U 1 1 593EB2CD
P 5100 4650
F 0 "#PWR041" H 5100 4400 50  0001 C CNN
F 1 "GND" H 5100 4500 50  0000 C CNN
F 2 "" H 5100 4650 50  0000 C CNN
F 3 "" H 5100 4650 50  0000 C CNN
	1    5100 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR042
U 1 1 593EB2D3
P 5100 5400
F 0 "#PWR042" H 5100 5150 50  0001 C CNN
F 1 "GND" H 5100 5250 50  0000 C CNN
F 2 "" H 5100 5400 50  0000 C CNN
F 3 "" H 5100 5400 50  0000 C CNN
	1    5100 5400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR043
U 1 1 593EB2D9
P 5100 5050
F 0 "#PWR043" H 5100 4900 50  0001 C CNN
F 1 "+3.3V" H 5100 5190 50  0000 C CNN
F 2 "" H 5100 5050 50  0000 C CNN
F 3 "" H 5100 5050 50  0000 C CNN
	1    5100 5050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR044
U 1 1 593EB2DF
P 5100 4300
F 0 "#PWR044" H 5100 4150 50  0001 C CNN
F 1 "+3.3V" H 5100 4440 50  0000 C CNN
F 2 "" H 5100 4300 50  0000 C CNN
F 3 "" H 5100 4300 50  0000 C CNN
	1    5100 4300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR045
U 1 1 593EB2E5
P 5100 3550
F 0 "#PWR045" H 5100 3400 50  0001 C CNN
F 1 "+3.3V" H 5100 3690 50  0000 C CNN
F 2 "" H 5100 3550 50  0000 C CNN
F 3 "" H 5100 3550 50  0000 C CNN
	1    5100 3550
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P10
U 1 1 593EB2EE
P 3600 4450
F 0 "P10" H 3600 4650 50  0000 C CNN
F 1 "LV_ADC" V 3700 4450 50  0000 C CNN
F 2 "YASU:XA_3Pin" H 3600 4450 50  0001 C CNN
F 3 "" H 3600 4450 50  0000 C CNN
	1    3600 4450
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 P11
U 1 1 593EB2F5
P 3600 5200
F 0 "P11" H 3600 5400 50  0000 C CNN
F 1 "LW_ADC" V 3700 5200 50  0000 C CNN
F 2 "YASU:XA_3Pin" H 3600 5200 50  0001 C CNN
F 3 "" H 3600 5200 50  0000 C CNN
	1    3600 5200
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 P9
U 1 1 593EB2FC
P 3600 3700
F 0 "P9" H 3600 3900 50  0000 C CNN
F 1 "LU_ADC" V 3700 3700 50  0000 C CNN
F 2 "YASU:XA_3Pin" H 3600 3700 50  0001 C CNN
F 3 "" H 3600 3700 50  0000 C CNN
	1    3600 3700
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR046
U 1 1 593EB303
P 3850 3900
F 0 "#PWR046" H 3850 3650 50  0001 C CNN
F 1 "GND" H 3850 3750 50  0000 C CNN
F 2 "" H 3850 3900 50  0000 C CNN
F 3 "" H 3850 3900 50  0000 C CNN
	1    3850 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR047
U 1 1 593EB309
P 3850 4650
F 0 "#PWR047" H 3850 4400 50  0001 C CNN
F 1 "GND" H 3850 4500 50  0000 C CNN
F 2 "" H 3850 4650 50  0000 C CNN
F 3 "" H 3850 4650 50  0000 C CNN
	1    3850 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR048
U 1 1 593EB30F
P 3850 5400
F 0 "#PWR048" H 3850 5150 50  0001 C CNN
F 1 "GND" H 3850 5250 50  0000 C CNN
F 2 "" H 3850 5400 50  0000 C CNN
F 3 "" H 3850 5400 50  0000 C CNN
	1    3850 5400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR049
U 1 1 593EB315
P 3850 5050
F 0 "#PWR049" H 3850 4900 50  0001 C CNN
F 1 "+3.3V" H 3850 5190 50  0000 C CNN
F 2 "" H 3850 5050 50  0000 C CNN
F 3 "" H 3850 5050 50  0000 C CNN
	1    3850 5050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR050
U 1 1 593EB31B
P 3850 4300
F 0 "#PWR050" H 3850 4150 50  0001 C CNN
F 1 "+3.3V" H 3850 4440 50  0000 C CNN
F 2 "" H 3850 4300 50  0000 C CNN
F 3 "" H 3850 4300 50  0000 C CNN
	1    3850 4300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR051
U 1 1 593EB321
P 3850 3550
F 0 "#PWR051" H 3850 3400 50  0001 C CNN
F 1 "+3.3V" H 3850 3690 50  0000 C CNN
F 2 "" H 3850 3550 50  0000 C CNN
F 3 "" H 3850 3550 50  0000 C CNN
	1    3850 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4350 3850 4300
Wire Notes Line
	3300 3300 3300 5600
Wire Notes Line
	3300 5600 4250 5600
Wire Notes Line
	4250 5600 4250 3300
Wire Notes Line
	4250 3300 3300 3300
Wire Notes Line
	4550 3300 4550 5600
Wire Notes Line
	4550 5600 5550 5600
Wire Notes Line
	5550 5600 5550 3300
Wire Notes Line
	5550 3300 4550 3300
Text Notes 5150 5700 0    60   ~ 0
Right arm
Text Notes 3850 5700 0    60   ~ 0
Left arm
Text HLabel 3900 5300 2    60   Output ~ 0
LeftW
Wire Wire Line
	3800 5200 3850 5200
Text HLabel 3900 4550 2    60   Output ~ 0
LeftV
Wire Wire Line
	3850 4450 3800 4450
Text HLabel 3900 3800 2    60   Output ~ 0
LeftU
Wire Wire Line
	3800 3800 3900 3800
Text HLabel 5150 3800 2    60   Output ~ 0
RightU
Text HLabel 5150 4550 2    60   Output ~ 0
RightV
Text HLabel 5150 5300 2    60   Output ~ 0
RightW
Wire Wire Line
	3800 3600 3850 3600
Wire Wire Line
	3850 3600 3850 3550
Wire Wire Line
	3800 3700 3850 3700
Wire Wire Line
	3850 3700 3850 3900
Wire Wire Line
	3850 4650 3850 4450
Wire Wire Line
	3800 4550 3900 4550
Wire Wire Line
	3800 4350 3850 4350
Wire Wire Line
	3850 5100 3800 5100
Wire Wire Line
	3850 5050 3850 5100
Wire Wire Line
	3850 5200 3850 5400
Wire Wire Line
	3800 5300 3900 5300
Wire Wire Line
	5050 3600 5100 3600
Wire Wire Line
	5100 3600 5100 3550
Wire Wire Line
	5100 3700 5100 3900
Wire Wire Line
	5050 3800 5150 3800
Wire Wire Line
	5050 3700 5100 3700
Wire Wire Line
	5050 4550 5150 4550
Wire Wire Line
	5050 4450 5100 4450
Wire Wire Line
	5100 4450 5100 4650
Wire Wire Line
	5050 4350 5100 4350
Wire Wire Line
	5100 4350 5100 4300
Wire Wire Line
	5050 5100 5100 5100
Wire Wire Line
	5100 5100 5100 5050
Wire Wire Line
	5050 5300 5150 5300
Wire Wire Line
	5050 5200 5100 5200
Wire Wire Line
	5100 5200 5100 5400
$EndSCHEMATC