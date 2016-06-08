#!/bin/bash
<<FILE_DETAILS
    File name: wifi_login.sh
    Usage: wifi_login.sh WiFiName WiFipassword
    Description: This script writes the Wifi Name and password into the Raspberry
    	Pi /etc/wpa_supplicant/wpa_supplicant.conf and clears out the previous 
    	content. swtichToWlanClient.sh will try to log in to the Wifi network 
	in this file.
FILE_DETAILS

NAME=$1
PASSWORD=$2
CONF_FILE=/etc/wpa_supplicant/wpa_supplicant.conf
sudo cat > $CONF_FILE << EOF
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
	ssid="$NAME"
	psk="$PASSWORD"
        key_mgmt=WPA-PSK
}
EOF
