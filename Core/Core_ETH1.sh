#!/bin/bash

source "Tests_Format.sh"

#Variablen
TEST_NAME="Test Core ETH-1"

#Ausgabe wird in F_Ist gespeichert
F_Ist=/tmp/Core_ETH1_IST

#Wenn Tests nicht erfolgreich beendet wird, Variable Test_NOK ist nicht gleich 0.
Test_NOK=0

TXT_OK="*** *** *** $TEST_NAME OK *** *** ***"
TXT_NOK="*** *** *** $TEST_NAME NOK *** *** ***"

#OUTPUT_OK="${Bold}${Green}*** *** *** Test ETH-1 OK *** *** ***${Reg}"
OUTPUT_OK="${Bold}${Black}${OnGreen}$TXT_OK${Rst}"

#OUTPUT_NOK="${Bold}${Red}*** *** *** Test ETH-1 NOK *** *** ***${Reg}"
OUTPUT_NOK="${Bold}${Black}${OnRed}$TXT_NOK${Rst}"

#Folgende Parameter werden erwartet:
#1- Speed: 100Mb/s
#2- Duplex: Full
#3- Port: Twisted Pair
#4- Auto-negotiation: on
#5- Link detected: yes

declare -a ETH_Param=(
	"Speed:\s100Mb/s"
	"Duplex:\sFull"
	"Port:\sTwisted\sPair"
	"Auto-negotiation:\son"
	"Link\sdetected:\syes"
)

#Funktionen
f_ParamCheck ()
{
	echo -e "${Bold}${Yellow}f_ParamCheck() - Param: $@ ${Rst}"
	grep $@ $F_Ist
	return $?
}


echo -e "$TXT_Section1_Yellow"
echo -e "${Bold}${Yellow}Start: $TEST_NAME${Rst}"
echo -e "$TXT_Section1_Yellow"

ethtool eth0 > $F_Ist

for i in "${ETH_Param[@]}"
do
	# Ist der Test noch Ok?
#	if [ $Test_NOK == 0 ]
#	then
		grep -E -o $i $F_Ist
		r=$?

		if [ $r -eq 0 ]
		then
			echo -e "${Bold}${Yellow}... OK!${Rst}"
		else
			#Test Fehlgeschlagen!!!
			Test_NOK=1 #Fehler!
			echo -e "${Bold}${Red} ... ERROR!!! ${Rst}"
		fi
#	fi
done

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

#TODO - Verbesserung: Das gleiche ohne Dateien => Siehe Variablen F_Ist