#!/bin/bash
sudo echo "y
y
y
$1
$2" > /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo echo "y
y
y
$1
$2" > ./info.txt
sudo bash /home/pi/Pi_Setup/cloudprint_Setup/cloudPrint.sh > log.txt 2>&1 &
sleep 20
sudo tail -n 1 log.txt
