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
$Comp
L CONN_01X02 P2
U 1 1 593BE59D
P 3800 3600
F 0 "P2" H 3800 3750 50  0000 C CNN
F 1 "CW" V 3900 3600 50  0000 C CNN
F 2 "YASU:XA_2Pin" H 3800 3600 50  0001 C CNN
F 3 "" H 3800 3600 50  0000 C CNN
	1    3800 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 3450 4050 3550
Wire Wire Line
	4000 3650 4050 3650
Wire Wire Line
	4050 3650 4050 3750
Connection ~ 4050 3550
$Comp
L +3.3V #PWR026
U 1 1 593BE5A9
P 4050 3100
F 0 "#PWR026" H 4050 2950 50  0001 C CNN
F 1 "+3.3V" H 4050 3240 50  0000 C CNN
F 2 "" H 4050 3100 50  0000 C CNN
F 3 "" H 4050 3100 50  0000 C CNN
	1    4050 3100
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 593BE5AF
P 4050 3300
F 0 "R6" V 4130 3300 50  0000 C CNN
F 1 "10k" V 4050 3300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3980 3300 50  0001 C CNN
F 3 "" H 4050 3300 50  0000 C CNN
	1    4050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3150 4050 3100
$Comp
L GND #PWR027
U 1 1 593BE5B7
P 4050 3750
F 0 "#PWR027" H 4050 3500 50  0001 C CNN
F 1 "GND" H 4050 3600 50  0000 C CNN
F 2 "" H 4050 3750 50  0000 C CNN
F 3 "" H 4050 3750 50  0000 C CNN
	1    4050 3750
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P4
U 1 1 593BE5BE
P 4650 3600
F 0 "P4" H 4650 3750 50  0000 C CNN
F 1 "CCW" V 4750 3600 50  0000 C CNN
F 2 "YASU:XA_2Pin" H 4650 3600 50  0001 C CNN
F 3 "" H 4650 3600 50  0000 C CNN
	1    4650 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	4850 3550 5100 3550
Wire Wire Line
	4900 3450 4900 3550
Wire Wire Line
	4850 3650 4900 3650
Wire Wire Line
	4900 3650 4900 3750
Connection ~ 4900 3550
$Comp
L +3.3V #PWR028
U 1 1 593BE5CA
P 4900 3100
F 0 "#PWR028" H 4900 2950 50  0001 C CNN
F 1 "+3.3V" H 4900 3240 50  0000 C CNN
F 2 "" H 4900 3100 50  0000 C CNN
F 3 "" H 4900 3100 50  0000 C CNN
	1    4900 3100
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 593BE5D0
P 4900 3300
F 0 "R8" V 4980 3300 50  0000 C CNN
F 1 "10k" V 4900 3300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4830 3300 50  0001 C CNN
F 3 "" H 4900 3300 50  0000 C CNN
	1    4900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3150 4900 3100
$Comp
L GND #PWR029
U 1 1 593BE5D8
P 4900 3750
F 0 "#PWR029" H 4900 3500 50  0001 C CNN
F 1 "GND" H 4900 3600 50  0000 C CNN
F 2 "" H 4900 3750 50  0000 C CNN
F 3 "" H 4900 3750 50  0000 C CNN
	1    4900 3750
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 593BE5DF
P 3700 5150
F 0 "P1" H 3700 5300 50  0000 C CNN
F 1 "Wall" V 3800 5150 50  0000 C CNN
F 2 "YASU:XA_2Pin" H 3700 5150 50  0001 C CNN
F 3 "" H 3700 5150 50  0000 C CNN
	1    3700 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 5100 4100 5100
Wire Wire Line
	3950 5000 3950 5100
Wire Wire Line
	3900 5200 3950 5200
Wire Wire Line
	3950 5200 3950 5300
Connection ~ 3950 5100
$Comp
L +3.3V #PWR030
U 1 1 593BE5EB
P 3950 4650
F 0 "#PWR030" H 3950 4500 50  0001 C CNN
F 1 "+3.3V" H 3950 4790 50  0000 C CNN
F 2 "" H 3950 4650 50  0000 C CNN
F 3 "" H 3950 4650 50  0000 C CNN
	1    3950 4650
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 593BE5F1
P 3950 4850
F 0 "R5" V 4030 4850 50  0000 C CNN
F 1 "10k" V 3950 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3880 4850 50  0001 C CNN
F 3 "" H 3950 4850 50  0000 C CNN
	1    3950 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4700 3950 4650
$Comp
L GND #PWR031
U 1 1 593BE5F9
P 3950 5300
F 0 "#PWR031" H 3950 5050 50  0001 C CNN
F 1 "GND" H 3950 5150 50  0000 C CNN
F 2 "" H 3950 5300 50  0000 C CNN
F 3 "" H 3950 5300 50  0000 C CNN
	1    3950 5300
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 593BE601
P 4600 5150
F 0 "P3" H 4600 5300 50  0000 C CNN
F 1 "Enable" V 4700 5150 50  0000 C CNN
F 2 "YASU:XA_2Pin" H 4600 5150 50  0001 C CNN
F 3 "" H 4600 5150 50  0000 C CNN
	1    4600 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	4800 5100 5000 5100
Wire Wire Line
	4850 5000 4850 5100
Wire Wire Line
	4800 5200 4850 5200
Wire Wire Line
	4850 5200 4850 5300
Connection ~ 4850 5100
$Comp
L +3.3V #PWR032
U 1 1 593BE60D
P 4850 4650
F 0 "#PWR032" H 4850 4500 50  0001 C CNN
F 1 "+3.3V" H 4850 4790 50  0000 C CNN
F 2 "" H 4850 4650 50  0000 C CNN
F 3 "" H 4850 4650 50  0000 C CNN
	1    4850 4650
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 593BE613
P 4850 4850
F 0 "R7" V 4930 4850 50  0000 C CNN
F 1 "10k" V 4850 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4780 4850 50  0001 C CNN
F 3 "" H 4850 4850 50  0000 C CNN
	1    4850 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4700 4850 4650
$Comp
L GND #PWR033
U 1 1 593BE61B
P 4850 5300
F 0 "#PWR033" H 4850 5050 50  0001 C CNN
F 1 "GND" H 4850 5150 50  0000 C CNN
F 2 "" H 4850 5300 50  0000 C CNN
F 3 "" H 4850 5300 50  0000 C CNN
	1    4850 5300
	1    0    0    -1  
$EndComp
Wire Notes Line
	3500 2800 3500 4000
Wire Notes Line
	3500 4000 5400 4000
Wire Notes Line
	5400 4000 5400 2800
Wire Notes Line
	5400 2800 3500 2800
Text HLabel 4250 3550 2    60   Output ~ 0
CW
Wire Wire Line
	4000 3550 4250 3550
Text HLabel 5100 3550 2    60   Output ~ 0
CCW
Text Notes 4450 4100 0    60   ~ 0
Robot rotation bottun
Wire Notes Line
	3500 4400 3500 5500
Wire Notes Line
	3500 5500 5400 5500
Wire Notes Line
	5400 5500 5400 4400
Wire Notes Line
	5400 4400 3500 4400
Text HLabel 4100 5100 2    60   Output ~ 0
Wall
Text HLabel 5000 5100 2    60   Output ~ 0
Enable
Text Notes 5200 5650 0    60   ~ 0
Etc.
$EndSCHEMATC
