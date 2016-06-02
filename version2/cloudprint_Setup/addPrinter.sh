#!/bin/bash
if [ -f /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt ]; then
    sudo rm /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt
fi
sudo touch /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt
usbs=$(lpinfo -v | grep -E "direct usb")
while read -r usb
do
    model=$(echo $usb | sed -r -e "s/direct usb:\/\/([^/]*)\/([^%]*).*/\2/")
    added=$(lpstat -p | grep "$model" | wc -l)
    if [ $added -eq 0 ]; then
        location=$(echo $usb | sed -r -e "s/direct (usb[^ ]*)/\1/")
        #attempting to match the correct model
        brand=$(echo $usb | sed -r -e "s/direct usb:\/\/([^/]*)\/.*/\1/")
        matched=$(lpinfo --make-and-model $brand -m | grep "$model" | wc -l)
        if [ $matched -eq 1 ]; then
            driver=$(lpinfo --make-and-model $brand -m | grep "$model" | head -n 1 | sed -r -e "s/([^ .]*) .*/\1/")
        else
            driver=$(lpinfo --make-and-model $brand -m | head -n 1 | sed -r -e "s/([^ .]*) .*/\1/")
        fi
	name=${brand}_${model}
        echo "$name" >> /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt
        lpadmin -p $name -E -m $driver -v $location
        sudo lp -d $name /home/pi/Pi_Setup/cloudprint_Setup/testPrint.txt
	sleep 5
    fi
done <<< "$usbs"
