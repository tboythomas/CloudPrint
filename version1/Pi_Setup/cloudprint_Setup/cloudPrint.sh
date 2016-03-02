#!/bin/bash
sudo apt-get install libcups2 libavahi-client3 avahi-daemon libsnmp30
wget https://github.com/google/cups-connector/releases/download/2016.01.02/gcp-cups-connector-rpi-jessie-2016.01.02.tar.gz
tar -xzvf gcp-cups-connector-rpi-jessie-2016.01.02.tar.gz
sudo useradd -s /usr/sbin/nologin -r -M gcp
sudo mkdir /opt/gcp_cups_connector
sudo mv cups-connector/gcp-cups-connector /opt/gcp_cups_connector
sudo mv cups-connector/gcp-cups-connector-util /opt/gcp_cups_connector
sudo chmod 755 /opt/gcp_cups_connector/gcp-cups-connector
sudo chmod 755 /opt/gcp_cups_connector/gcp-cups-connector-util
sudo chown gcp:gcp /opt/gcp_cups_connector/gcp-cups-connector
sudo chown gcp:gcp /opt/gcp_cups_connector/gcp-cups-connector-util
rmdir cups-connector
sudo cp ./gcp.service /etc/systemd/system
sudo chmod 664 /etc/systemd/system/gcp.service
sudo chown root:root /etc/systemd/system/gcp.service
echo "hellO"
/opt/gcp_cups_connector/gcp-cups-connector-util init < info.txt
echo "done"
sudo mkdir /etc/gcp_cups_connector
sudo mv ./gcp-cups-connector.config.json /etc/gcp_cups_connector
sudo chmod 660 /etc/gcp_cups_connector/gcp-cups-connector.config.json
sudo chown gcp:gcp /etc/gcp_cups_connector/gcp-cups-connector.config.json
sudo systemctl enable gcp
