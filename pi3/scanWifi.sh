#!/bin/bash
sudo iwlist wlan0 scan | grep ESSID | sed -r -e 's/.*"([^.]*)".*/\1/I' > /home/pi/Pi_Setup/web_Server/wifiList.txt
