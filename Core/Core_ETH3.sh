#!/bin/bash

source "Tests_Format.sh"

TEST_NAME="Test Core ETH-3"
Test_NOK=0

#IP_ATE="192.168.0.59"
IP_ATE="192.168.168.73"

TXT_OK="*** *** *** $TEST_NAME OK *** *** ***"
TXT_NOK="*** *** *** $TEST_NAME NOK *** *** ***"

OUTPUT_OK="${Bold}${Black}${OnGreen}$TXT_OK${Rst}"
OUTPUT_NOK="${Bold}${Black}${OnRed}$TXT_NOK${Rst}"

echo -e "$TXT_Section1_Yellow"
echo -e "${Bold}${Yellow}Start: $TEST_NAME${Rst}"
echo -e "Connecting with Address: $IP_ATE"
echo -e "$TXT_Section1_Yellow"

echo -e "\n\n\n"
echo -e "$TXT_Section2_Yellow"
echo -e "${Bold}${Yellow}$TEST_NAME: 1/2 - Start${Rst}"
echo -e "$TXT_Section2_Yellow"
iperf3 -t 1800 -4 -c $IP_ATE -t 10

if [ $? -eq 0 ]
then
    echo -e "${Bold}${Green}$TEST_NAME:  1/2 OK!${Rst}"
else
    echo -e "${Bold}${Red}$TEST_NAME: 1/2 ERROR!!!${Rst}"
    echo -e "${Bold}${Red}Please Run server: $ iperf3 -s${Rst}"
    Test_NOK=1
fi

echo -e "\n\n\n"
echo -e "$TXT_Section2_Yellow"
echo -e "${Bold}${Yellow}$TEST_NAME: 2/2 - Start${Rst}"
echo -e "$TXT_Section2_Yellow"
iperf3 -t 1800 -4 -R -c $IP_ATE -t 10

if [ $? -eq 0 ]
then
    echo -e "${Bold}${Green}Test 2 OK!${Rst}"
else
    echo -e "${Bold}${Red}$TEST_NAME: 2/2 ERROR!!!${Rst}"
    echo -e "${Bold}${Red}Please Run server: $ iperf3 -s${Rst}"
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

echo -e "$Test_Ending"

#TODO Basistestfälle ändern: https://kunbus-gmbh.atlassian.net/wiki/spaces/EN/pages/2662498321/Basistestf+lle+f+r+automatisierte+Imagetests+RevPi+Core#ETH-2