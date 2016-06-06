#!/bin/bash
<<FILE_DETAILS
	File name: print.sh
	Usage: print.sh PRINTER_BRAND FILE
		PRINTER_BRAND: the brand name of a printer (one that is connected to the device)
		FILE: the file that is printed from the printer
	Description: This script finds the corresponding printer from the given printer brand
		and prints the indicated file.
FILE_DETAILS

printer=`lpstat -p | grep -i $1 | sed -r -e "s/.* ($1[^ .]*) .*/\1/I"`
sudo lp -d $printer $2
