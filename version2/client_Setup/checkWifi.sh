#!/bin/bash
<<FILE_DETAILS
    File name: checkWifi.sh
    Usage: checkWifi.sh WifiName
    Description: This script checks if the Raspberry Pi has connected to the given
        WiFi or not. If the argument WiFiName is in the iwconfig wlan0 port list, 
        outputs 1. Otherwise, outputs 0.
FILE_DETAILS

sudo iwconfig wlan0 | grep $1 | wc -l
