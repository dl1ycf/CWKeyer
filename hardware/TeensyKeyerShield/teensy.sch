EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 3 3
Title "Teensy CW Keyer Shield"
Date "2021-11-03"
Rev "1.0"
Comp "SofterHardware"
Comment1 "KF7O Steve Haynal"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L TeensyKeyerShield:Teensy4.0 U3
U 1 1 60B420B6
P 5700 4450
F 0 "U3" H 5700 6065 50  0000 C CNN
F 1 "Teensy4.0" H 5700 5974 50  0000 C CNN
F 2 "TeensyKeyerShield:Teensy40" H 5300 4650 50  0001 C CNN
F 3 "" H 5300 4650 50  0001 C CNN
	1    5700 4450
	1    0    0    -1  
$EndComp
Text GLabel 7050 5700 2    50   Output ~ 0
MCLK
Text GLabel 4300 5800 0    50   Output ~ 0
BCLK
Text GLabel 4300 5700 0    50   Output ~ 0
LRCLK
Text GLabel 4350 3900 0    50   Output ~ 0
DACDAT
Text GLabel 4350 4000 0    50   Input ~ 0
ADCDAT
Text GLabel 3850 5800 3    50   Output ~ 0
SCLK
Text GLabel 3950 5800 3    50   BiDi ~ 0
SDIN
NoConn ~ 6800 3100
NoConn ~ 6800 3200
NoConn ~ 6800 5300
$Comp
L power:+3.3V #PWR049
U 1 1 60B5AAB0
P 7050 5600
F 0 "#PWR049" H 7050 5450 50  0001 C CNN
F 1 "+3.3V" V 7050 5750 50  0000 L CNN
F 2 "" H 7050 5600 50  0001 C CNN
F 3 "" H 7050 5600 50  0001 C CNN
	1    7050 5600
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR047
U 1 1 60B5B131
P 7050 5400
F 0 "#PWR047" H 7050 5250 50  0001 C CNN
F 1 "+5V" V 7050 5550 50  0000 L CNN
F 2 "" H 7050 5400 50  0001 C CNN
F 3 "" H 7050 5400 50  0001 C CNN
	1    7050 5400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR048
U 1 1 60B5B9B3
P 7050 5500
F 0 "#PWR048" H 7050 5250 50  0001 C CNN
F 1 "GND" V 7055 5372 50  0001 R CNN
F 2 "" H 7050 5500 50  0001 C CNN
F 3 "" H 7050 5500 50  0001 C CNN
	1    7050 5500
	0    -1   -1   0   
$EndComp
NoConn ~ 6800 3600
NoConn ~ 6800 3800
NoConn ~ 6800 3300
NoConn ~ 6800 3400
NoConn ~ 6800 3500
NoConn ~ 6800 3700
NoConn ~ 6800 3900
NoConn ~ 6800 4000
$Comp
L power:+3.3V #PWR041
U 1 1 60B5CF9F
P 4350 4600
F 0 "#PWR041" H 4350 4450 50  0001 C CNN
F 1 "+3.3V" V 4350 4750 50  0000 L CNN
F 2 "" H 4350 4600 50  0001 C CNN
F 3 "" H 4350 4600 50  0001 C CNN
	1    4350 4600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR042
U 1 1 60B5E0E3
P 4350 4700
F 0 "#PWR042" H 4350 4450 50  0001 C CNN
F 1 "GND" V 4355 4572 50  0001 R CNN
F 2 "" H 4350 4700 50  0001 C CNN
F 3 "" H 4350 4700 50  0001 C CNN
	1    4350 4700
	0    1    1    0   
$EndComp
NoConn ~ 4600 4500
NoConn ~ 4600 4800
NoConn ~ 4600 4900
$Comp
L power:GND #PWR043
U 1 1 60B5EB67
P 4550 3050
F 0 "#PWR043" H 4550 2800 50  0001 C CNN
F 1 "GND" V 4555 2922 50  0001 R CNN
F 2 "" H 4550 3050 50  0001 C CNN
F 3 "" H 4550 3050 50  0001 C CNN
	1    4550 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6800 5400 7050 5400
Wire Wire Line
	7050 5500 6800 5500
Wire Wire Line
	6800 5600 7050 5600
Wire Wire Line
	7050 5700 6800 5700
Wire Wire Line
	4350 3900 4600 3900
Wire Wire Line
	4600 4000 4350 4000
Wire Wire Line
	4350 4600 4600 4600
Wire Wire Line
	4600 4700 4350 4700
Wire Wire Line
	4600 5000 3900 5000
Wire Wire Line
	3800 5100 4600 5100
$Comp
L power:+3.3V #PWR031
U 1 1 60B8D62C
P 2900 4300
F 0 "#PWR031" H 2900 4150 50  0001 C CNN
F 1 "+3.3V" V 2900 4450 50  0000 L CNN
F 2 "" H 2900 4300 50  0001 C CNN
F 3 "" H 2900 4300 50  0001 C CNN
	1    2900 4300
	0    -1   -1   0   
$EndComp
Text Notes 1800 4350 0    50   ~ 0
RA8875/ILI9488\ndisplay experiments,\noptional GPIO or\nJTAG to HL2
Wire Wire Line
	4300 5700 4600 5700
Wire Wire Line
	4600 5800 4300 5800
$Comp
L Connector_Generic:Conn_01x04 J10
U 1 1 60BA2067
P 3250 5600
F 0 "J10" H 3450 5400 50  0000 C CNN
F 1 "Conn_01x04" H 3330 5501 50  0001 L CNN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 3250 5600 50  0001 C CNN
F 3 "~" H 3250 5600 50  0001 C CNN
	1    3250 5600
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR037
U 1 1 60BB097D
P 3500 5700
F 0 "#PWR037" H 3500 5550 50  0001 C CNN
F 1 "+3.3V" V 3550 5750 50  0000 L CNN
F 2 "" H 3500 5700 50  0001 C CNN
F 3 "" H 3500 5700 50  0001 C CNN
	1    3500 5700
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR040
U 1 1 60BB15EE
P 3700 5900
F 0 "#PWR040" H 3700 5650 50  0001 C CNN
F 1 "GND" V 3705 5772 50  0001 R CNN
F 2 "" H 3700 5900 50  0001 C CNN
F 3 "" H 3700 5900 50  0001 C CNN
	1    3700 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5700 3500 5700
Wire Wire Line
	3950 5800 3950 5550
Wire Wire Line
	3950 5500 4600 5500
Wire Wire Line
	3850 5800 3850 5600
Wire Wire Line
	3850 5600 4600 5600
Text Notes 3000 6200 0    50   ~ 0
Optional 128x32\nSSD1306 display\nor other i2c device\nJST PH Stemma
Wire Wire Line
	4600 3100 4550 3100
Wire Wire Line
	4550 3100 4550 3050
$Comp
L Device:Ferrite_Bead_Small FB13
U 1 1 60BD2F03
P 6000 1650
F 0 "FB13" V 5900 1700 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 5854 1650 50  0001 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 5930 1650 50  0001 C CNN
F 3 "~" H 6000 1650 50  0001 C CNN
F 4 "C76892" H 6000 1650 50  0001 C CNN "LCSC"
	1    6000 1650
	0    -1   1    0   
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB12
U 1 1 60BD34E7
P 5950 1750
F 0 "FB12" V 6050 1750 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 5804 1750 50  0001 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 5880 1750 50  0001 C CNN
F 3 "~" H 5950 1750 50  0001 C CNN
F 4 "C76892" H 5950 1750 50  0001 C CNN "LCSC"
	1    5950 1750
	0    -1   1    0   
$EndComp
$Comp
L Device:C_Small C32
U 1 1 60BD4BCA
P 5750 1900
F 0 "C32" H 5800 2000 50  0000 L CNN
F 1 "10nF" H 5800 1800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5750 1900 50  0001 C CNN
F 3 "~" H 5750 1900 50  0001 C CNN
F 4 "C57112" H 5750 1900 50  0001 C CNN "LCSC"
	1    5750 1900
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C31
U 1 1 60BD8193
P 5450 1900
F 0 "C31" H 5500 2000 50  0000 L CNN
F 1 "10nF" H 5500 1800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5450 1900 50  0001 C CNN
F 3 "~" H 5450 1900 50  0001 C CNN
F 4 "C57112" H 5450 1900 50  0001 C CNN "LCSC"
	1    5450 1900
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R13
U 1 1 60BDFFD8
P 5750 1500
F 0 "R13" H 5650 1400 50  0000 C CNN
F 1 "DNI" V 5750 1500 39  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 5750 1500 50  0001 C CNN
F 3 "~" H 5750 1500 50  0001 C CNN
	1    5750 1500
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R12
U 1 1 60BE43B8
P 5450 1500
F 0 "R12" H 5350 1400 50  0000 C CNN
F 1 "DNI" V 5450 1500 39  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 5450 1500 50  0001 C CNN
F 3 "~" H 5450 1500 50  0001 C CNN
	1    5450 1500
	1    0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR045
U 1 1 60BE4773
P 5800 1350
F 0 "#PWR045" H 5800 1200 50  0001 C CNN
F 1 "+3.3V" V 5850 1450 50  0000 L CNN
F 2 "" H 5800 1350 50  0001 C CNN
F 3 "" H 5800 1350 50  0001 C CNN
	1    5800 1350
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR044
U 1 1 60BFEF84
P 5600 2100
F 0 "#PWR044" H 5600 1850 50  0001 C CNN
F 1 "GND" V 5605 1972 50  0001 R CNN
F 2 "" H 5600 2100 50  0001 C CNN
F 3 "" H 5600 2100 50  0001 C CNN
	1    5600 2100
	-1   0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB10
U 1 1 60C02618
P 2900 1650
F 0 "FB10" V 2800 1700 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 2754 1650 50  0001 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 2830 1650 50  0001 C CNN
F 3 "~" H 2900 1650 50  0001 C CNN
F 4 "C76892" H 2900 1650 50  0001 C CNN "LCSC"
	1    2900 1650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR029
U 1 1 60C02EF6
P 2700 1550
F 0 "#PWR029" H 2700 1300 50  0001 C CNN
F 1 "GND" V 2705 1422 50  0001 R CNN
F 2 "" H 2700 1550 50  0001 C CNN
F 3 "" H 2700 1550 50  0001 C CNN
	1    2700 1550
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C29
U 1 1 60C03200
P 3100 1800
F 0 "C29" H 3150 1900 50  0000 L CNN
F 1 "10nF" H 3150 1700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3100 1800 50  0001 C CNN
F 3 "~" H 3100 1800 50  0001 C CNN
F 4 "C57112" H 3100 1800 50  0001 C CNN "LCSC"
	1    3100 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R8
U 1 1 60C0518E
P 3100 1500
F 0 "R8" H 3000 1400 50  0000 C CNN
F 1 "DNI" V 3100 1500 39  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 3100 1500 50  0001 C CNN
F 3 "~" H 3100 1500 50  0001 C CNN
	1    3100 1500
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR033
U 1 1 60C05502
P 3050 1350
F 0 "#PWR033" H 3050 1200 50  0001 C CNN
F 1 "+3.3V" V 3000 1450 50  0000 L CNN
F 2 "" H 3050 1350 50  0001 C CNN
F 3 "" H 3050 1350 50  0001 C CNN
	1    3050 1350
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR035
U 1 1 60C079B0
P 3100 1950
F 0 "#PWR035" H 3100 1700 50  0001 C CNN
F 1 "GND" V 3105 1822 50  0001 R CNN
F 2 "" H 3100 1950 50  0001 C CNN
F 3 "" H 3100 1950 50  0001 C CNN
	1    3100 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR030
U 1 1 60C1D614
P 2700 2400
F 0 "#PWR030" H 2700 2150 50  0001 C CNN
F 1 "GND" V 2705 2272 50  0001 R CNN
F 2 "" H 2700 2400 50  0001 C CNN
F 3 "" H 2700 2400 50  0001 C CNN
	1    2700 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB11
U 1 1 60C1D956
P 2900 2500
F 0 "FB11" V 2800 2550 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 2754 2500 50  0001 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 2830 2500 50  0001 C CNN
F 3 "~" H 2900 2500 50  0001 C CNN
F 4 "C76892" H 2900 2500 50  0001 C CNN "LCSC"
	1    2900 2500
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C30
U 1 1 60C1DD40
P 3100 2650
F 0 "C30" H 3150 2750 50  0000 L CNN
F 1 "10nF" H 3150 2550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3100 2650 50  0001 C CNN
F 3 "~" H 3100 2650 50  0001 C CNN
F 4 "C57112" H 3100 2650 50  0001 C CNN "LCSC"
	1    3100 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R9
U 1 1 60C1E112
P 3100 2350
F 0 "R9" H 3000 2250 50  0000 C CNN
F 1 "DNI" V 3100 2350 39  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 3100 2350 50  0001 C CNN
F 3 "~" H 3100 2350 50  0001 C CNN
	1    3100 2350
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR034
U 1 1 60C1E4CA
P 3050 2200
F 0 "#PWR034" H 3050 2050 50  0001 C CNN
F 1 "+3.3V" V 3100 2300 50  0000 L CNN
F 2 "" H 3050 2200 50  0001 C CNN
F 3 "" H 3050 2200 50  0001 C CNN
	1    3050 2200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR036
U 1 1 60C23B9A
P 3100 2800
F 0 "#PWR036" H 3100 2550 50  0001 C CNN
F 1 "GND" V 3105 2672 50  0001 R CNN
F 2 "" H 3100 2800 50  0001 C CNN
F 3 "" H 3100 2800 50  0001 C CNN
	1    3100 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3200 4450 3200
Wire Wire Line
	4600 3300 4350 3300
Wire Wire Line
	4600 3400 4150 3400
Wire Wire Line
	4600 3500 3950 3500
Wire Wire Line
	3100 2450 3100 2500
Connection ~ 3100 2500
Wire Wire Line
	3100 2500 3000 2500
Wire Wire Line
	3100 2500 3100 2550
Wire Wire Line
	2700 2400 2650 2400
Wire Wire Line
	2650 2500 2700 2500
Connection ~ 2700 2500
Wire Wire Line
	2700 2500 2800 2500
Wire Wire Line
	3100 2750 3100 2800
Wire Wire Line
	2700 1550 2650 1550
Wire Wire Line
	3100 1600 3100 1650
Connection ~ 3100 1650
Wire Wire Line
	3100 1650 3000 1650
Wire Wire Line
	3100 1650 3100 1700
Wire Wire Line
	3100 1900 3100 1950
Wire Wire Line
	3100 2250 3100 2200
Wire Wire Line
	3100 2200 3050 2200
Wire Wire Line
	6200 1650 6100 1650
Wire Wire Line
	5800 1350 5750 1350
Wire Wire Line
	5750 1350 5750 1400
Wire Wire Line
	5750 1350 5450 1350
Wire Wire Line
	5450 1350 5450 1400
Connection ~ 5750 1350
Wire Wire Line
	5450 1600 5450 1750
Connection ~ 5450 1750
Wire Wire Line
	5450 1750 5850 1750
Wire Wire Line
	5450 1800 5450 1750
Wire Wire Line
	5750 1800 5750 1650
Connection ~ 5750 1650
Wire Wire Line
	5750 1650 5900 1650
Wire Wire Line
	5750 1650 5750 1600
Wire Wire Line
	5750 2000 5750 2050
Wire Wire Line
	5750 2050 5600 2050
Wire Wire Line
	5450 2050 5450 2000
Wire Wire Line
	5600 2100 5600 2050
Connection ~ 5600 2050
Wire Wire Line
	5600 2050 5450 2050
Text Notes 7150 1700 2    50   ~ 0
CW Paddle
Text Notes 1500 1700 0    50   ~ 0
CW Straight Key
Text Notes 1500 2550 0    50   ~ 0
PTT
NoConn ~ 6800 4200
NoConn ~ 6800 4700
NoConn ~ 6800 4800
$Comp
L Device:R_POT RV1
U 1 1 60CC2782
P 2300 4800
F 0 "RV1" H 2400 4950 50  0000 C CNN
F 1 "25K" V 2300 4800 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_T-16H_Single_Horizontal" H 2300 4800 50  0001 C CNN
F 3 "~" H 2300 4800 50  0001 C CNN
	1    2300 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 60CD20F9
P 2300 5000
F 0 "#PWR026" H 2300 4750 50  0001 C CNN
F 1 "GND" V 2305 4872 50  0001 R CNN
F 2 "" H 2300 5000 50  0001 C CNN
F 3 "" H 2300 5000 50  0001 C CNN
	1    2300 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C26
U 1 1 60CD9783
P 2500 4900
F 0 "C26" H 2600 4950 50  0000 L CNN
F 1 "0.1uF" H 2600 4850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2500 4900 50  0001 C CNN
F 3 "~" H 2500 4900 50  0001 C CNN
F 4 "C14663" H 2500 4900 50  0001 C CNN "LCSC"
	1    2500 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV2
U 1 1 60CDB4BE
P 2300 5300
F 0 "RV2" H 2400 5450 50  0000 C CNN
F 1 "25K" V 2300 5300 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_T-16H_Single_Horizontal" H 2300 5300 50  0001 C CNN
F 3 "~" H 2300 5300 50  0001 C CNN
	1    2300 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 60CDB7B6
P 2300 5500
F 0 "#PWR027" H 2300 5250 50  0001 C CNN
F 1 "GND" V 2305 5372 50  0001 R CNN
F 2 "" H 2300 5500 50  0001 C CNN
F 3 "" H 2300 5500 50  0001 C CNN
	1    2300 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV3
U 1 1 60CDCC78
P 2300 5800
F 0 "RV3" H 2400 5950 50  0000 C CNN
F 1 "25K" V 2300 5800 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_T-16H_Single_Horizontal" H 2300 5800 50  0001 C CNN
F 3 "~" H 2300 5800 50  0001 C CNN
	1    2300 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 60CDCF8A
P 2300 6000
F 0 "#PWR028" H 2300 5750 50  0001 C CNN
F 1 "GND" V 2305 5872 50  0001 R CNN
F 2 "" H 2300 6000 50  0001 C CNN
F 3 "" H 2300 6000 50  0001 C CNN
	1    2300 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C27
U 1 1 60CDF325
P 2500 5400
F 0 "C27" H 2600 5450 50  0000 L CNN
F 1 "0.1uF" H 2600 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2500 5400 50  0001 C CNN
F 3 "~" H 2500 5400 50  0001 C CNN
F 4 "C14663" H 2500 5400 50  0001 C CNN "LCSC"
	1    2500 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C28
U 1 1 60CDF65D
P 2500 5900
F 0 "C28" H 2550 5950 50  0000 L CNN
F 1 "0.1uF" H 2550 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2500 5900 50  0001 C CNN
F 3 "~" H 2500 5900 50  0001 C CNN
F 4 "C14663" H 2500 5900 50  0001 C CNN "LCSC"
	1    2500 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6000 2300 6000
Wire Wire Line
	2300 5950 2300 6000
Connection ~ 2300 6000
Wire Wire Line
	2450 5800 2500 5800
Wire Wire Line
	2450 5300 2500 5300
Wire Wire Line
	2300 5450 2300 5500
Wire Wire Line
	2300 5500 2500 5500
Connection ~ 2300 5500
Wire Wire Line
	2300 4950 2300 5000
Wire Wire Line
	2300 5000 2500 5000
Connection ~ 2300 5000
Wire Wire Line
	2500 4800 2450 4800
$Comp
L power:+3.3V #PWR025
U 1 1 60D19D66
P 2150 4650
F 0 "#PWR025" H 2150 4500 50  0001 C CNN
F 1 "+3.3V" V 2050 4650 50  0000 L CNN
F 2 "" H 2150 4650 50  0001 C CNN
F 3 "" H 2150 4650 50  0001 C CNN
	1    2150 4650
	0    -1   1    0   
$EndComp
Wire Wire Line
	2300 5650 2150 5650
Wire Wire Line
	2150 5650 2150 5150
Wire Wire Line
	2300 4650 2150 4650
Connection ~ 2150 4650
Wire Wire Line
	2300 5150 2150 5150
Connection ~ 2150 5150
Wire Wire Line
	2150 5150 2150 4650
Wire Wire Line
	2500 4800 3600 4800
Wire Wire Line
	3600 4800 3600 5200
Wire Wire Line
	3600 5200 4600 5200
Connection ~ 2500 4800
Wire Wire Line
	4600 5300 2500 5300
Connection ~ 2500 5300
Wire Wire Line
	3700 5800 3700 5900
Wire Wire Line
	3450 5800 3700 5800
Wire Wire Line
	2500 5800 2950 5800
Wire Wire Line
	2950 5800 2950 5400
Wire Wire Line
	2950 5400 4600 5400
Connection ~ 2500 5800
Text Notes 1800 4850 0    50   ~ 0
Volume
Text Notes 1800 5350 0    50   ~ 0
Sidetone\nVolume
Text Notes 8300 5850 0    50   ~ 0
Speed
$Comp
L Device:R_POT RV4
U 1 1 60D5FF65
P 7950 5800
F 0 "RV4" H 8050 5950 50  0000 C CNN
F 1 "25K" V 7950 5800 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_T-16H_Single_Horizontal" H 7950 5800 50  0001 C CNN
F 3 "~" H 7950 5800 50  0001 C CNN
	1    7950 5800
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C33
U 1 1 60D61500
P 7750 5900
F 0 "C33" H 7800 5950 50  0000 L CNN
F 1 "0.1uF" H 7800 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 7750 5900 50  0001 C CNN
F 3 "~" H 7750 5900 50  0001 C CNN
F 4 "C14663" H 7750 5900 50  0001 C CNN "LCSC"
	1    7750 5900
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR054
U 1 1 60D62367
P 7950 6000
F 0 "#PWR054" H 7950 5750 50  0001 C CNN
F 1 "GND" V 7955 5872 50  0001 R CNN
F 2 "" H 7950 6000 50  0001 C CNN
F 3 "" H 7950 6000 50  0001 C CNN
	1    7950 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR053
U 1 1 60D63013
P 7950 5600
F 0 "#PWR053" H 7950 5450 50  0001 C CNN
F 1 "+3.3V" H 7850 5750 50  0000 L CNN
F 2 "" H 7950 5600 50  0001 C CNN
F 3 "" H 7950 5600 50  0001 C CNN
	1    7950 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 5600 7950 5650
Wire Wire Line
	7950 5950 7950 6000
Wire Wire Line
	7800 5800 7750 5800
Wire Wire Line
	7750 5800 6800 5800
Connection ~ 7750 5800
Wire Wire Line
	7750 6000 7950 6000
Connection ~ 7950 6000
Text Notes 1800 5800 0    50   ~ 0
Pitch
Wire Wire Line
	2650 3200 2750 3200
Wire Wire Line
	2750 3200 2750 3400
Wire Wire Line
	2750 3750 2900 3750
Wire Wire Line
	2900 3400 2750 3400
Connection ~ 2750 3400
Wire Wire Line
	2750 3400 2750 3750
$Comp
L power:GND #PWR039
U 1 1 60E82572
P 3550 3750
F 0 "#PWR039" H 3550 3500 50  0001 C CNN
F 1 "GND" V 3555 3622 50  0001 R CNN
F 2 "" H 3550 3750 50  0001 C CNN
F 3 "" H 3550 3750 50  0001 C CNN
	1    3550 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 60E82D6C
P 3550 3400
F 0 "#PWR038" H 3550 3150 50  0001 C CNN
F 1 "GND" V 3555 3272 50  0001 R CNN
F 2 "" H 3550 3400 50  0001 C CNN
F 3 "" H 3550 3400 50  0001 C CNN
	1    3550 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3400 3550 3400
Wire Wire Line
	3550 3750 3500 3750
$Comp
L Device:R_Small R11
U 1 1 60E962D0
P 3850 3700
F 0 "R11" V 3950 3700 50  0000 C CNN
F 1 "470" V 3850 3700 39  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 3850 3700 50  0001 C CNN
F 3 "~" H 3850 3700 50  0001 C CNN
F 4 "C23179" H 3850 3700 50  0001 C CNN "LCSC"
	1    3850 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 60E982EE
P 3850 3600
F 0 "R10" V 3750 3600 50  0000 C CNN
F 1 "470" V 3850 3600 39  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 3850 3600 50  0001 C CNN
F 3 "~" H 3850 3600 50  0001 C CNN
F 4 "C23179" H 3850 3600 50  0001 C CNN "LCSC"
	1    3850 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 3600 3750 3200
Wire Wire Line
	3750 3200 3500 3200
Wire Wire Line
	3650 3550 3500 3550
Wire Wire Line
	3950 3600 4600 3600
Wire Wire Line
	3950 3500 3950 2500
Wire Wire Line
	3100 2500 3600 2500
Wire Wire Line
	4150 3400 4150 1650
Wire Wire Line
	3100 1650 4150 1650
Wire Wire Line
	3050 1350 3100 1350
Wire Wire Line
	3100 1350 3100 1400
Text Notes 1500 3300 0    50   ~ 0
HL2 Key/PTT
Text GLabel 3600 2450 1    50   Input ~ 0
MICPTT
Wire Wire Line
	3600 2450 3600 2500
Connection ~ 3600 2500
Wire Wire Line
	3600 2500 3950 2500
$Comp
L power:+3.3V #PWR055
U 1 1 61041C99
P 8000 2700
F 0 "#PWR055" H 8000 2550 50  0001 C CNN
F 1 "+3.3V" H 7900 2850 50  0000 L CNN
F 2 "" H 8000 2700 50  0001 C CNN
F 3 "" H 8000 2700 50  0001 C CNN
	1    8000 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C34
U 1 1 61042A83
P 7850 2900
F 0 "C34" H 7900 3000 50  0000 L CNN
F 1 "47uF" H 7900 2800 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 7850 2900 50  0001 C CNN
F 3 "~" H 7850 2900 50  0001 C CNN
F 4 "C96123" H 7850 2900 50  0001 C CNN "LCSC"
	1    7850 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR056
U 1 1 610432CD
P 8000 3100
F 0 "#PWR056" H 8000 2850 50  0001 C CNN
F 1 "GND" V 8005 2972 50  0001 R CNN
F 2 "" H 8000 3100 50  0001 C CNN
F 3 "" H 8000 3100 50  0001 C CNN
	1    8000 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C35
U 1 1 6104BD64
P 8150 2900
F 0 "C35" H 8200 3000 50  0000 L CNN
F 1 "0.1uF" H 8200 2800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 8150 2900 50  0001 C CNN
F 3 "~" H 8150 2900 50  0001 C CNN
F 4 "C14663" H 8150 2900 50  0001 C CNN "LCSC"
	1    8150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2800 7850 2750
Wire Wire Line
	7850 2750 8000 2750
Wire Wire Line
	8150 2750 8150 2800
Wire Wire Line
	8000 2700 8000 2750
Connection ~ 8000 2750
Wire Wire Line
	8000 2750 8150 2750
Wire Wire Line
	7850 3000 7850 3050
Wire Wire Line
	7850 3050 8000 3050
Wire Wire Line
	8150 3050 8150 3000
Wire Wire Line
	8000 3100 8000 3050
Connection ~ 8000 3050
Wire Wire Line
	8000 3050 8150 3050
$Comp
L Connector:AudioJack3_SwitchTR J7
U 1 1 61715451
P 2450 1650
F 0 "J7" H 2432 1883 50  0000 C CNN
F 1 "AudioJack3_SwitchTR" H 2432 1884 50  0001 C CNN
F 2 "TeensyKeyerShield:STEREO_TRS" H 2450 1650 50  0001 C CNN
F 3 "~" H 2450 1650 50  0001 C CNN
	1    2450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1650 2700 1650
Wire Wire Line
	2650 1850 2700 1850
Wire Wire Line
	2700 1850 2700 1650
Connection ~ 2700 1650
Wire Wire Line
	2700 1650 2800 1650
NoConn ~ 2650 1750
NoConn ~ 2650 1950
$Comp
L Connector:AudioJack3_SwitchTR J8
U 1 1 61741316
P 2450 2500
F 0 "J8" H 2432 2733 50  0000 C CNN
F 1 "AudioJack3_SwitchTR" H 2432 2734 50  0001 C CNN
F 2 "TeensyKeyerShield:STEREO_TRS" H 2450 2500 50  0001 C CNN
F 3 "~" H 2450 2500 50  0001 C CNN
	1    2450 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2700 2700 2700
Wire Wire Line
	2700 2500 2700 2700
NoConn ~ 2650 2600
NoConn ~ 2650 2800
$Comp
L Connector:AudioJack3_SwitchTR J9
U 1 1 6176680A
P 2450 3300
F 0 "J9" H 2432 3533 50  0000 C CNN
F 1 "AudioJack3_SwitchTR" H 2432 3534 50  0001 C CNN
F 2 "TeensyKeyerShield:STEREO_TRS" H 2450 3300 50  0001 C CNN
F 3 "~" H 2450 3300 50  0001 C CNN
	1    2450 3300
	1    0    0    -1  
$EndComp
NoConn ~ 2650 3400
NoConn ~ 2650 3600
Wire Wire Line
	6050 1750 6100 1750
Wire Wire Line
	6100 1750 6100 1850
Wire Wire Line
	6100 1850 6200 1850
$Comp
L Isolator:LTV-827S U2
U 2 1 60DD0854
P 3200 3300
F 0 "U2" H 3200 3500 50  0000 C CNN
F 1 "MOCD217R2M" H 3200 3534 50  0001 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3200 3000 50  0001 C CNN
F 3 "" H 2400 3850 50  0001 C CNN
	2    3200 3300
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:LTV-827S U2
U 1 1 60DCF0C7
P 3200 3650
F 0 "U2" H 3050 3450 50  0000 C CNN
F 1 "MOCD217R2M" H 3200 4300 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3200 3350 50  0001 C CNN
F 3 "" H 2400 4200 50  0001 C CNN
F 4 "C14315" H 3200 3650 50  0001 C CNN "LCSC"
	1    3200 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2650 3300 2850 3300
Wire Wire Line
	2850 3300 2850 3200
Wire Wire Line
	2850 3200 2900 3200
Wire Wire Line
	2850 3500 2850 3550
Wire Wire Line
	2850 3550 2900 3550
Wire Wire Line
	2650 3500 2850 3500
NoConn ~ 6800 4100
NoConn ~ 6800 4300
NoConn ~ 6800 4400
NoConn ~ 6800 4500
NoConn ~ 6800 4600
NoConn ~ 6800 4900
NoConn ~ 6800 5000
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J11
U 1 1 618AEB67
P 3250 4300
F 0 "J11" H 3300 4000 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 3300 3966 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 3250 4300 50  0001 C CNN
F 3 "~" H 3250 4300 50  0001 C CNN
	1    3250 4300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 618D0B30
P 2900 4500
F 0 "#PWR0101" H 2900 4250 50  0001 C CNN
F 1 "GND" V 2905 4372 50  0001 R CNN
F 2 "" H 2900 4500 50  0001 C CNN
F 3 "" H 2900 4500 50  0001 C CNN
	1    2900 4500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 618D12E2
P 2900 4100
F 0 "#PWR0102" H 2900 3850 50  0001 C CNN
F 1 "GND" V 2905 3972 50  0001 R CNN
F 2 "" H 2900 4100 50  0001 C CNN
F 3 "" H 2900 4100 50  0001 C CNN
	1    2900 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 4500 3900 4500
Wire Wire Line
	3900 4500 3900 5000
Wire Wire Line
	3450 4400 4600 4400
Wire Wire Line
	4600 4200 4400 4200
Wire Wire Line
	4400 4200 4400 4300
Wire Wire Line
	4400 4300 3450 4300
Wire Wire Line
	4600 4100 4300 4100
Wire Wire Line
	4300 4100 4300 4200
Wire Wire Line
	4300 4200 3450 4200
Wire Wire Line
	4600 4300 4500 4300
Wire Wire Line
	4500 4300 4500 4150
Wire Wire Line
	4500 4150 3750 4150
Wire Wire Line
	3750 4150 3750 4100
Wire Wire Line
	3750 4100 3450 4100
$Comp
L Device:R_Small R14
U 1 1 61901CFB
P 3600 4650
F 0 "R14" V 3700 4550 50  0000 C CNN
F 1 "470" V 3600 4650 39  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 3600 4650 50  0001 C CNN
F 3 "~" H 3600 4650 50  0001 C CNN
F 4 "C23179" H 3600 4650 50  0001 C CNN "LCSC"
	1    3600 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 5100 3800 4650
Wire Wire Line
	3800 4650 3700 4650
Wire Wire Line
	2950 4400 2700 4400
Wire Wire Line
	2700 4400 2700 4650
Wire Wire Line
	2700 4650 3500 4650
Wire Wire Line
	2900 4100 2950 4100
Wire Wire Line
	2900 4300 2950 4300
Wire Wire Line
	2900 4500 2950 4500
Wire Wire Line
	4000 3950 2700 3950
Wire Wire Line
	2700 3950 2700 4200
Wire Wire Line
	2700 4200 2950 4200
$Comp
L power:GND #PWR046
U 1 1 60C02267
P 6150 1550
F 0 "#PWR046" H 6150 1300 50  0001 C CNN
F 1 "GND" V 6155 1422 50  0001 R CNN
F 2 "" H 6150 1550 50  0001 C CNN
F 3 "" H 6150 1550 50  0001 C CNN
	1    6150 1550
	0    1    -1   0   
$EndComp
Wire Wire Line
	6200 1550 6150 1550
NoConn ~ 6200 1750
NoConn ~ 6200 1950
$Comp
L Connector:AudioJack3_SwitchTR J12
U 1 1 61791EEB
P 6400 1650
F 0 "J12" H 6400 1900 50  0000 R CNN
F 1 "AudioJack3_SwitchTR" H 6382 1884 50  0001 C CNN
F 2 "TeensyKeyerShield:STEREO_TRS" H 6400 1650 50  0001 C CNN
F 3 "~" H 6400 1650 50  0001 C CNN
	1    6400 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4350 3300 4350 1750
Wire Wire Line
	4350 1750 5450 1750
Wire Wire Line
	4450 3200 4450 1650
Wire Wire Line
	4450 1650 5750 1650
Wire Wire Line
	3750 3700 3650 3700
Wire Wire Line
	3650 3700 3650 3550
Wire Wire Line
	3950 3700 4600 3700
Wire Wire Line
	4600 3800 4000 3800
Wire Wire Line
	4000 3800 4000 3950
Wire Wire Line
	3850 5600 3850 5500
Wire Wire Line
	3850 5500 3450 5500
Connection ~ 3850 5600
Wire Wire Line
	3450 5600 3500 5600
Wire Wire Line
	3500 5600 3500 5550
Wire Wire Line
	3500 5550 3950 5550
Connection ~ 3950 5550
Wire Wire Line
	3950 5550 3950 5500
$EndSCHEMATC
