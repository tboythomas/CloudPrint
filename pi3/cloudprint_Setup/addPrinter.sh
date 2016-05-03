#!/bin/bash

usb=$(lpinfo -v | grep -E "direct usb")
brand=$(echo $usb | sed -r -e "s/direct usb:\/\/([^/]*)\/.*/\1/")
location=$(echo $usb | sed -r -e "s/direct (usb[^ ]*)/\1/")
model=$(lpinfo --make-and-model $brand -m | head -n 1 | sed -r -e "s/([^ .]*) .*/\1/")
lpadmin -p $brand -E -m $model -v $location
sudo lp -d $brand /home/pi/Pi_Setup/cloudprint_Setup/testPrint.txt
