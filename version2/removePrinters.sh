#!/bin/bash
<<FILE_DETAILS
	File name: removePrinters.sh
	Usage: removePrinters.sh
	Description: This script removed all printers that have been added to
		the system.
FILE_DETAILS

#list out all printers by name in printers.txt
lpstat -p | grep printer | sed -r -e "s/printer ([^ ]*) .*/\1/" > printers.txt
#removing all printers
while read printer; do
	lpadmin -x $printer
done < printers.txt
sudo rm printers.txt
