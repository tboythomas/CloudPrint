#!/bin/bash
sudo echo "y
y
y
$1
$2" > /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo chmod 644 /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo chown pi:pi /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo touch /home/pi/Pi_Setup/cloudprint_Setup/log.txt
sudo chmod 644 /home/pi/Pi_Setup/cloudprint_Setup/log.txt
sudo chown pi:pi /home/pi/Pi_Setup/cloudprint_Setup/log.txt
sudo bash /home/pi/Pi_Setup/cloudprint_Setup/cloudPrint.sh > /home/pi/Pi_Setup/cloudprint_Setup/log.txt &
sleep 10
sudo tail -n 1 /home/pi/Pi_Setup/cloudprint_Setup/log.txt
