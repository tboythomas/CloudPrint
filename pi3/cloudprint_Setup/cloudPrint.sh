#!/bin/bash
<<FILE_DETAILS
    File name: cloudPrint.sh
    Usage: cloudPrint.sh
    Description: This script runs the Google CUPS Connector executable using the information 
	    from info.txt as the required user input and sets up the generated file to
	    enable cloud printing through the device.
FILE_DETAILS

/opt/gcp_cups_connector/gcp-cups-connector-util init < /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo mkdir /etc/gcp_cups_connector
sudo mv ./gcp-cups-connector.config.json /etc/gcp_cups_connector
sudo chmod 660 /etc/gcp_cups_connector/gcp-cups-connector.config.json
sudo chown gcp:gcp /etc/gcp_cups_connector/gcp-cups-connector.config.json
sudo systemctl enable gcp
sleep 2
sudo systemctl restart gcp
