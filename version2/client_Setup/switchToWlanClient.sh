#!/bin/bash
<<FILE_DETAILS
    File name: swtichToWlanClient.sh
    Usage: swtichToWlanClient.sh
    Description: This script converts the Raspberry Pi to wlan client mode.
        Reboot not required after converting.
FILE_DETAILS

echo "--> Switching to wlan client mode"
echo "--> Shut down wlan0"
sudo ifdown --force wlan0
echo "--> Copying client network interfaces file"
sudo cp /home/pi/Pi_Setup/client_Setup/interfaces.client /etc/network/interfaces

echo "--> Copying ip_forward files"
sudo cp /home/pi/Pi_Setup/client_Setup/sysctl.conf /etc/sysctl.conf
# disables ip forwarding
sudo sh -c "echo 0 > /proc/sys/net/ipv4/ip_forward"
echo "--> Stopping hostapd"
sudo service hostapd stop
echo "--> Stopping isc-dhcp-server"
sudo service isc-dhcp-server stop
sleep 3

# Brute force to get wlan to come back up
echo "--> Starting interface wlan0"
sudo ifup wlan0
sleep 2
sudo ifdown wlan0
sleep 2
sudo ifup wlan0

