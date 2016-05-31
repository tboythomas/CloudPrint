#!/bin/bash

printer=$(sudo cat /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt | grep -i $1)
lpadmin -x $printer
found=$(echo "$printer" | wc -l)
if [ -z "$printer" ]; then
	echo "1"
else
	echo "$printer"
fi
