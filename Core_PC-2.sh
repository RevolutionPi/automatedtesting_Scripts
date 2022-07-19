#!/bin/bash

source "Tests_Format.sh"

TEST_NAME="Test Core PC-2"

TXT_OK="*** *** *** $TEST_NAME OK *** *** ***"
TXT_NOK="*** *** *** $TEST_NAME NOK *** *** ***"

OUTPUT_OK="${Bold}${Black}${OnGreen}$TXT_OK${Rst}"
OUTPUT_NOK="${Bold}${Black}${OnRed}$TXT_NOK${Rst}"

echo -e "$TXT_Section1_Yellow"
echo -e "${Bold}${Yellow}$TEST_NAME${Rst}"
echo -e "$TXT_Section1_Yellow"

ls -l /dev/pi*
rv=$?

echo -e "\n\n\n"

if [ $rv -eq 0 ]
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