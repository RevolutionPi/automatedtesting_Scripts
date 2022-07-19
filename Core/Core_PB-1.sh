#!/bin/bash

source "Tests_Format.sh"

TEST_NAME="Test Core PB-1"

TXT_OK="*** *** *** $TEST_NAME OK *** *** ***"
TXT_NOK="*** *** *** $TEST_NAME NOK *** *** ***"

OUTPUT_OK="${Bold}${Black}${OnGreen}$TXT_OK${Rst}"
OUTPUT_NOK="${Bold}${Black}${OnRed}$TXT_NOK${Rst}"

echo -e "$TXT_Section1_Yellow"
echo -e "${Bold}${Yellow}$TEST_NAME${Rst}"
echo -e "$TXT_Section1_Yellow"

Test_OK=0
#.............................................................
#.............................................................
#.............................................................
#Ausgänge auf 0 gesetzt.
#Write DIO O_1 => 0
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DIO O_1 => 0${Rst}"
piTest -w O_1,0
echo -e "$TXT_Section3_Yellow"
#.............................................................
#Write DO O_1_i06 => 0
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DO O_1_i06 => 0${Rst}"
piTest -w O_1_i06,0
echo -e "$TXT_Section3_Yellow"
#.............................................................
#.............................................................
#.............................................................
sleep 1
#Read DIO I_1 => Output DIO_1
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DIO I_1 => 0${Rst}"
piTest -q -1 -r I_1
if [ $? -ne 0 ]
then
    Test_OK=1
fi
echo -e "$TXT_Section3_Yellow"
#.............................................................
#Read DIO I_1 => Output DO_1
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DIO I_2 => 0${Rst}"
piTest -q -1 -r I_2
if [ $? -ne 0 ]
then
    Test_OK=1
fi
echo -e "$TXT_Section3_Yellow"
#.............................................................
#.............................................................
#.............................................................
sleep 1
#Ausgänge auf 1 setzen.
#Write DIO O_1 => 1
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DIO O_1 => 1${Rst}"
piTest -w O_1,1
echo -e "$TXT_Section3_Yellow"
#.............................................................
#Write DO O_1_i06 => 1
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DO O_1_i06 => 1${Rst}"
piTest -w O_1_i06,1
echo -e "$TXT_Section3_Yellow"
#.............................................................
#.............................................................
#.............................................................
sleep 1
#Read DIO I_1 => Output DIO_1
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DIO I_1 => 1${Rst}"
piTest -q -1 -r I_1
if [ $? -ne 0 ]
then
    Test_OK=1
fi
echo -e "$TXT_Section3_Yellow"
#.............................................................
#Read DIO I_1 => Output DO_1
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DIO I_2 => 1${Rst}"
piTest -q -1 -r I_2
if [ $? -ne 0 ]
then
    Test_OK=1
fi
echo -e "$TXT_Section3_Yellow"
#.............................................................
#.............................................................
#.............................................................
sleep 1
#Ausgänge auf 0 gesetzt.
#Write DIO O_1 => 0
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DIO O_1 => 0${Rst}"
piTest -w O_1,0
echo -e "$TXT_Section3_Yellow"
#.............................................................
#Write DO O_1_i06 => 0
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DO O_1_i06 => 0${Rst}"
piTest -w O_1_i06,0
echo -e "$TXT_Section3_Yellow"
#.............................................................
#.............................................................
#.............................................................
sleep 1
#Read DIO I_1 => Output DIO_1
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DIO I_1 => 0${Rst}"
piTest -q -1 -r I_1
if [ $? -ne 0 ]
then
    Test_OK=1
fi
echo -e "$TXT_Section3_Yellow"
#.............................................................
#Read DIO I_1 => Output DO_1
echo -e "$TXT_Section3_Yellow"
echo -e "${Bold}${Yellow}DIO I_2 => 0${Rst}"
piTest -q -1 -r I_2
if [ $? -ne 0 ]
then
    Test_OK=1
fi
echo -e "$TXT_Section3_Yellow"
#.............................................................
#.............................................................
#.............................................................








echo -e "\n\n\n"

if [ $Test_OK -eq 0 ]
then
   	echo -e "$TXT_Section3_Green"
	echo -e "$OUTPUT_OK"
	echo -e "$TXT_Section3_Green"
else
	echo -e "$TXT_Section3_Red"
	echo -e "$OUTPUT_NOK"
	echo -e "$TXT_Section3_Red"
fi

echo -e "$Test_Ending"