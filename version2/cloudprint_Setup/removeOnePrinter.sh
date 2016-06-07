#!/bin/bash
<<FILE_DETAILS
	File name: removeOnePrinter.sh
	Usage: removeOnePrinter.sh PRINTER_BRAND
	Description: This script is used to remove only one printer at a time that 
		failed to be added during auto printer set-up. This script uses the 
		input arguement brand  and checks the lastPrinter file to find existing 
		matching printer brand. Then it attempts to remove the printer and report 
		back the result.
FILE_DETAILS

# look for printer that failed to be added
printer=$(sudo cat /home/pi/Pi_Setup/cloudprint_Setup/lastPrinter.txt | grep -i $1)
# remove the printer
lpadmin -x $printer
found=$(echo "$printer" | wc -l)
# report back the result
if [ -z "$printer" ]; then
	echo "1"
else
	echo "$printer"
fi
