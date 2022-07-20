#!/bin/bash

source "Tests_Format.sh"

TEST_NAME="Test Core LED-1"
Test_NOK=0

#Ausgabe wird in F_Ist gespeichert
F_Ist=/tmp/Core_LED1_Output_IST

TXT_OK="*** *** *** Test LED-1 OK *** *** ***"
TXT_NOK="*** *** *** Test LED-1 NOK!!! *** *** ***"

OUTPUT_OK="${Bold}${Black}${OnGreen}$TXT_OK${Rst}"
OUTPUT_NOK="${Bold}${Black}${OnRed}$TXT_NOK${Rst}"

LEDs_Core_tree=(
	"├── a1_green -> ../../devices/platform/leds/leds/a1_green"
	"├── a1_red -> ../../devices/platform/leds/leds/a1_red"
	"├── a2_green -> ../../devices/platform/leds/leds/a2_green"
	"├── a2_red -> ../../devices/platform/leds/leds/a2_red"
	"├── default-on -> ../../devices/virtual/leds/default-on"
	"├── mmc0 -> ../../devices/virtual/leds/mmc0"
	"└── power_red -> ../../devices/platform/leds/leds/power_red"
)

echo -e "$TXT_Section1_Yellow"
echo -e "${Bold}${Yellow}$TEST_NAME${Rst}"
echo -e "$TXT_Section1_Yellow"

tree /sys/class/leds > $F_Ist

cat $F_Ist | grep "${LEDs_Core_tree[0]}"
if [ $? -ne 0 ]
then
	Test_NOK=1
fi
cat $F_Ist | grep "${LEDs_Core_tree[1]}"
if [ $? -ne 0 ]
then
	Test_NOK=1
fi
cat $F_Ist | grep  "${LEDs_Core_tree[2]}"
if [ $? -ne 0 ]
then
	Test_NOK=1
fi
cat $F_Ist | grep "${LEDs_Core_tree[3]}"
if [ $? -ne 0 ]
then
	Test_NOK=1
fi
cat $F_Ist | grep "${LEDs_Core_tree[4]}"
if [ $? -ne 0 ]
then
	Test_NOK=1
fi
cat $F_Ist | grep "${LEDs_Core_tree[5]}"
if [ $? -ne 0 ]
then
	Test_NOK=1
fi
cat $F_Ist | grep "${LEDs_Core_tree[6]}"
if [ $? -ne 0 ]
then
	Test_NOK=1
fi

echo -e "\n\n\n"

if [ $Test_NOK == 0 ]
then
	echo -e "$TXT_Section3_Green"
	echo -e "$OUTPUT_OK"
	echo -e "$TXT_Section3_Green"	
else
	echo -e "$TXT_Section3_Red"
	echo -e "$OUTPUT_NOK"
	echo -e "$TXT_Section3_Red"
fi

rm $F_Ist

echo -e "$Test_Ending"