#!/bin/bash
sudo echo "y
y
y
$1
foo" > /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo chmod 644 /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo chown pi:pi /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo touch /home/pi/Pi_Setup/cloudprint_Setup/log.txt
sudo chmod 644 /home/pi/Pi_Setup/cloudprint_Setup/log.txt
sudo chown pi:pi /home/pi/Pi_Setup/cloudprint_Setup/log.txt
sudo bash /home/pi/Pi_Setup/cloudprint_Setup/cloudPrint.sh > /home/pi/Pi_Setup/cloudprint_Setup/log.txt &
sleep 10
sudo tail -n 1 /home/pi/Pi_Setup/cloudprint_Setup/log.txt > /home/pi/Pi_Setup/cloudprint_Setup/code.txt
sudo cat /home/pi/Pi_Setup/cloudprint_Setup/success.txt /home/pi/Pi_Setup/cloudprint_Setup/code.txt > /home/pi/Pi_Setup/cloudprint_Setup/success_code.txt
usb=$(lpinfo -v | grep -E "direct usb" | head -1)
model=$(echo $usb | sed -r -e "s/direct usb:\/\/([^/]*)\/([^%]*).*/\2/")
brand=$(echo $usb | sed -r -e "s/direct usb:\/\/([^/]*)\/.*/\1/")
name=${brand}_${model}
sudo lp -d $name /home/pi/Pi_Setup/cloudprint_Setup/success_code.txt
