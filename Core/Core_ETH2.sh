#!/bin/bash

source "Tests_Format.sh"

TEST_NAME="Test Core ETH-2"

echo -e "$TXT_Section1_Yellow"
echo -e "${Bold}${Yellow}Start: $TEST_NAME${Rst}"
echo -e "$TXT_Section1_Yellow"

ip a show eth0

# IP Address mit Farben...
echo -e "$TXT_Section3_Green"
echo -e "${Bold}${Yellow}"
echo "IP Address"
ip a show eth0 | grep inet
echo -e "${Rst}"
echo -e "$TXT_Section3_Yellow"

echo -e "$Test_Ending"

#TODO Basistestfälle ändern: https://kunbus-gmbh.atlassian.net/wiki/spaces/EN/pages/2662498321/Basistestf+lle+f+r+automatisierte+Imagetests+RevPi+Core#ETH-2