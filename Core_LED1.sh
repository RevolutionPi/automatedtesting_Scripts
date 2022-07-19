#!/bin/bash

source "Tests_Format.sh"

TEST_NAME="Test Core LED-1"

#Ausgabe wird in F_Ist gespeichert
F_Ist=/tmp/Core_LED1_Output_IST

#Ausgabe sollte wie F_Soll sein
F_Soll=Core_LED1_Output_SOLL

TXT_OK="*** *** *** Test LED-1 OK *** *** ***"
TXT_NOK="*** *** *** Test LED-1 NOK!!! *** *** ***"

OUTPUT_OK="${Bold}${Black}${OnGreen}$TXT_OK${Rst}"
OUTPUT_NOK="${Bold}${Black}${OnRed}$TXT_NOK${Rst}"

echo -e "$TXT_Section1_Yellow"
echo -e "${Bold}${Yellow}$TEST_NAME${Rst}"
echo -e "$TXT_Section1_Yellow"

tree /sys/class/leds > $F_Ist

diff $F_Ist $F_Soll
rv=$?

echo -e "\n\n\n"

if [ $rv == 0 ]
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

#TODO - Verbesserung: Das gleiche ohne Dateien => Siehe Variablen F_Ist - F_Soll