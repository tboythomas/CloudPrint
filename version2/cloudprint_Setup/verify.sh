#!/bin/bash
<<FILE_DETAILS
	File name: verify.sh
	Usage: verify.sh
	Description: This script checks if the serial number of this
		device is an offical Plugable device
FILE_DETAILS

serial=`cat /proc/cpuinfo | grep Serial | cut -d ':' -f 2`
verified=`grep $serial /home/pi/Pi_Setup/cloudprint_Setup/serialList.txt | wc -l`
echo $verified
