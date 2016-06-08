#!/bin/bash
<<FILE_DETAILS
    File name: test.sh
    Usage: test.sh counter
    Description: This script takes one integer parameter N.
    	And it converts the Pi from the AP mode to WlanClient mode
    	N times. Designed for testing the network convertion scripts.
FILE_DETAILS

counter=1
while [ $counter -le $1 ]
do
	echo ""
	echo "switching to client mode..."
	sudo /home/pi/Pi_Setup/client_Setup/switchToWlanClient.sh > /dev/null
	sleep 10
	echo "checking connection..."
	sudo /home/pi/Pi_Setup/client_Setup/checkWifi.sh YueYue
	echo "back to AP mode..."
	sudo /home/pi/Pi_Setup/AP_Setup/toRouter.sh
	sleep 2
	echo "--- done $counter ---"
	((counter++))
done
