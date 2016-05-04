#!/bin/bash

lpstat -p | grep printer | sed -r -e "s/printer ([^ ]*) .*/\1/" > printers.txt
while read printer; do
	lpadmin -x $printer
done < printers.txt
sudo rm printers.txt
