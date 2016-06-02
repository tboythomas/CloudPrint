#!/bin/bash
/opt/gcp_cups_connector/gcp-cups-connector-util init < /home/pi/Pi_Setup/cloudprint_Setup/info.txt
sudo mkdir /etc/gcp_cups_connector
sudo mv ./gcp-cups-connector.config.json /etc/gcp_cups_connector
sudo chmod 660 /etc/gcp_cups_connector/gcp-cups-connector.config.json
sudo chown gcp:gcp /etc/gcp_cups_connector/gcp-cups-connector.config.json
sudo systemctl enable gcp
sleep 2
sudo systemctl restart gcp
