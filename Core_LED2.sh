#!/bin/bash

source "Tests_Format.sh"

TEST_NAME="Test Core LED-2"

TXT_START="*** *** *** Test LED-2 START - Visual Test! *** *** ***"
TXT_END="*** *** *** Test LED-2 END *** *** ***"

OUTPUT_START="${Bold}${Black}${OnYellow}$TXT_START${Rst}"
OUTPUT_END="${Bold}${Black}${OnGreen}$TXT_END${Rst}"

LED_TIME=1 #.5

LEDs_Core=(
	"a1_green"
	"a1_red"
	"a2_green"
	"a2_red"
)

echo -e "$TXT_Section1_Yellow"
echo -e "${Bold}${Yellow}$TEST_NAME${Rst}"
echo -e "$TXT_Section1_Yellow"

echo -e "$OUTPUT_START"

for i in {0..3}
do
	echo -e ${Bold}${Yellow}${LEDs_Core[$i]}${Rst}
	echo 1 > /sys/class/leds/${LEDs_Core[$i]}/brightness
	sleep $LED_TIME
	echo 0 > /sys/class/leds/${LEDs_Core[$i]}/brightness
done

echo -e "$TXT_Section3_Green"
echo -e "$OUTPUT_END"
echo -e "$TXT_Section3_Green"	

echo -e "$Test_Ending"