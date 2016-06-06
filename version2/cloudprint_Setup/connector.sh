#!/bin/bash
<<FILE_DETAILS
	File name: connector.sh
	Usage: connector.sh EMAIL PROXY_NAME
		EMAIL: a Google account that you would like to use for Google cloud printing
		PROXY_NAME: a unique name for this device
	Description: This script generates the information needed to run the Google CUPS Connector executable and
		starts running the Google CUPS Connector in the background while saving its output to a log file. 
		After waiting for the executable to generate a code, the code is extracted from the log file and printed
		from the device's connected printer.
FILE_DETAILS

sudo echo "y
y
y
$1
$2
" > /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo chmod 644 /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo chown pi:pi /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo touch /home/pi/Pi_Setup/cloudprint_Setup/log.txt
sudo chmod 644 /home/pi/Pi_Setup/cloudprint_Setup/log.txt
sudo chown pi:pi /home/pi/Pi_Setup/cloudprint_Setup/log.txt
sudo bash /home/pi/Pi_Setup/cloudprint_Setup/cloudPrint.sh > /home/pi/Pi_Setup/cloudprint_Setup/log.txt &
sleep 15
sudo tail -n 1 /home/pi/Pi_Setup/cloudprint_Setup/log.txt > /home/pi/Pi_Setup/cloudprint_Setup/code.txt
sudo cat /home/pi/Pi_Setup/cloudprint_Setup/success.txt /home/pi/Pi_Setup/cloudprint_Setup/code.txt > /home/pi/Pi_Setup/cloudprint_Setup/success_code.txt
usb=$(lpinfo -v | grep -E "direct usb" | head -1)
model=$(echo $usb | sed -r -e "s/direct usb:\/\/([^/]*)\/([^%]*).*/\2/")
brand=$(echo $usb | sed -r -e "s/direct usb:\/\/([^/]*)\/.*/\1/")
name=${brand}_${model}
sudo lp -d $name /home/pi/Pi_Setup/cloudprint_Setup/success_code.txt
