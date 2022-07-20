#!/bin/bash

source "Tests_Format.sh"

TEST_NAME="Test Core HDMI"
Test_NOK=0

TXT_OK="*** *** *** $TEST_NAME OK *** *** ***"
TXT_NOK="*** *** *** $TEST_NAME NOK *** *** ***"

OUTPUT_OK="${Bold}${Black}${OnGreen}$TXT_OK${Rst}"
OUTPUT_NOK="${Bold}${Black}${OnRed}$TXT_NOK${Rst}"

#Running from ATE...
#snap connect hdmi-usb-dongle:hardware-observe :hardware-observe
#snap connect hdmi-usb-dongle:audio-record :audio-record
#snap connect hdmi-usb-dongle:camera :camera

sleep 2 && scrot Core_Test_HDMI.png -u & sleep 3 && killall mplayer & hdmi-usb-dongle

eog Core_Test_HDMI.png & 

#sleep 3

python3 Test_HDMI_001.py 

Test_NOK=$?

killall eog # & python3 python/HDMI_02.py

rm Core_Test_HDMI.png

#snap disconnect hdmi-usb-dongle:hardware-observe :hardware-observe
#snap disconnect hdmi-usb-dongle:audio-record :audio-record
#snap disconnect hdmi-usb-dongle:camera :camera

echo -e "$Test_Ending"

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

echo -e "$Test_Ending"

#TODO Basistestfälle ändern: https://kunbus-gmbh.atlassian.net/wiki/spaces/EN/pages/2662498321/Basistestf+lle+f+r+automatisierte+Imagetests+RevPi+Core#HDMI