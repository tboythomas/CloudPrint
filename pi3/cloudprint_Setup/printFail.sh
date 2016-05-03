#!/bin/bash

brand=`lpinfo -v | grep -E "direct usb" | sed -r -e "s/direct usb:\/\/([^/]*)\/.*/\1/"`
sudo lp -d $brand /home/pi/Pi_Setup/cloudprint_Setup/fail.txt
