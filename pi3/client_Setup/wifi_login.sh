#!/bin/bash

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
