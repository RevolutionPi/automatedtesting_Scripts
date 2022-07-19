#Delay in Sekunden
TEST_DELAY=5

#Funktion Ethernet
bash ./Core_ETH1.sh
sleep $TEST_DELAY

bash ./Core_ETH1.sh
sleep $TEST_DELAY

bash ./Core_ETH1.sh
sleep $TEST_DELAY

#Funktion USB
bash ./Core_USB-1.sh
sleep $TEST_DELAY

#TODO USB2
#TODO USB3
#TODO USB4
#TODO USB5

#Funktion piControl
bash ./Core_PC-1.sh
sleep $TEST_DELAY

bash ./Core_PC-2.sh
sleep $TEST_DELAY

#Funktion piBridge Gateway
bash ./Core_PT-1.sh
sleep $TEST_DELAY

#Funktion piBridge IO-Module
#TODO Das ist noch offen...
#TODO PB4
#TODO PB3

#Funktion HDMI
#TODO HDMI

#Funktion LEDs
bash ./Core_LED1.sh
sleep $TEST_DELAY

bash ./Core_LED2.sh
sleep $TEST_DELAY
