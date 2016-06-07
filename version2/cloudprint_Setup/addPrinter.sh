#!/bin/bash
<<FILE_DETAILS
	File name: addPrinter.sh
	Usage: addPrinter.sh
	Description: This script detects any printers that are connected to
		the USB port and identifies that ones that are not added to
		the system. The scripts then add the un-added printers. It
		also store the printers that are added in each execution in
		the file /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt
FILE_DETAILS

if [ -f /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt ]; then
    sudo rm /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt
fi
sudo touch /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt
# detects all usb printers
usbs=$(lpinfo -v | grep -E "direct usb")
# go through each usb printer
while read -r usb
do
    # extract printer model name
    model=$(echo $usb | sed -r -e "s/direct usb:\/\/([^/]*)\/([^%]*).*/\2/")
    added=$(lpstat -p | grep "$model" | wc -l)
    if [ $added -eq 0 ]; then
        location=$(echo $usb | sed -r -e "s/direct (usb[^ ]*)/\1/")
        # attempting to match the correct model
        brand=$(echo $usb | sed -r -e "s/direct usb:\/\/([^/]*)\/.*/\1/")
        matched=$(lpinfo --make-and-model $brand -m | grep "$model" | wc -l)
        if [ $matched -eq 1 ]; then
            driver=$(lpinfo --make-and-model $brand -m | grep "$model" | head -n 1 | sed -r -e "s/([^ .]*) .*/\1/")
        else
            driver=$(lpinfo --make-and-model $brand -m | head -n 1 | sed -r -e "s/([^ .]*) .*/\1/")
        fi
	name=${brand}_${model}
        echo "$name" >> /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt
        # add the printer to the system
        lpadmin -p $name -E -m $driver -v $location
        # print out a test page
        sudo lp -d $name /home/pi/Pi_Setup/cloudprint_Setup/testPrint.txt
	sleep 5
    fi
done <<< "$usbs"
