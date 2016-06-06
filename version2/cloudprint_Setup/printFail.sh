#!/bin/bash
<<FILE_DETAILS
	File name: printFail.sh
	Usage: printFail.sh
	Description: This script finds the printer that is directly connected to the device
		and prints fail.txt from the printer.
FILE_DETAILS

brand=`lpinfo -v | grep -E "direct usb" | sed -r -e "s/direct usb:\/\/([^/]*)\/.*/\1/"`
sudo lp -d $brand /home/pi/Pi_Setup/cloudprint_Setup/fail.txt
