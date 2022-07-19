#!/bin/bash

source "Tests_Format.sh"

TEST_NAME="Test Core PT-1"

HW_UPDATE="The\sfirmware\sof\ssome\sI/O\smodules\smust\sbe\supdated."

HW_NOT_PRESENT="Module\sis\sNOT\spresent"

TXT_OK="*** *** *** $TEST_NAME OK *** *** ***"
TXT_NOK="*** *** *** $TEST_NAME NOK *** *** ***"

OUTPUT_OK="${Bold}${Black}${OnGreen}$TXT_OK${Rst}"
OUTPUT_NOK="${Bold}${Black}${OnRed}$TXT_NOK${Rst}"

echo -e "$TXT_Section1_Yellow"
echo -e "${Bold}${Yellow}$TEST_NAME${Rst}"
echo -e "$TXT_Section1_Yellow"

echo -e "${Bold}${Yellow}piTest -x${Rst}"
piTest -x

if [ $? -eq 0 ]
then
    echo -e "${Bold}${Yellow}\npiTest -d${Rst}"

    #Ausgabe wird angezeigt
    piTest -d

    #Überprüfung Module-NOT-PRESENT
    piTest -d | grep $HW_NOT_PRESENT
    rv=$?

    echo -e "\n\n\n"

    if [ $rv -ne 0 ]
    then
        echo -e "$TXT_Section3_Green"
        echo -e "$OUTPUT_OK"
        echo -e "$TXT_Section3_Green"
    else
        echo -e "$TXT_Section3_Red"
        echo -e "${Bold}${Red}Module is NOT present, data is NOT available!!!${Rst}"
        echo -e "$OUTPUT_NOK"
        echo -e "$TXT_Section3_Red"
    fi

    #Überprüfung Module-UPDATE
    piTest -d | grep $HW_UPDATE
    if [ $? -eq 0 ]
    then
        echo -e "\n\n\n"
        echo -e "$TXT_Section3_Yellow"
        echo -e "${Bold}${Yellow}=====> The firmware of some I/O modules must be updated.'${Rst}"
        echo -e "${Bold}${Yellow}=====> Please connect only one module to the RevPi and call 'piTest -f'${Rst}"
        echo -e "$TXT_Section3_Yellow"
    fi
else
    echo -e "${Bold}${Red}piTest -x ERROR!!!${Rst}"
fi

echo -e "$Test_Ending"

#TODO Muss das Konstelation-speziefisch angepasst werden?