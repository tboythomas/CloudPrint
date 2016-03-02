#!/bin/bash
# install access point host software
sudo apt-get install hostapd
sudo apt-get install isc-dhcp-server
sudo ifdown --force wlan0
sudo pkill wpa_supplicant
# set up dhcp server
sudo cp /home/pi/Pi_Setup/AP_Setup/dhcpd.conf /etc/dhcp/dhcpd.conf
sudo cp /home/pi/Pi_Setup/AP_Setup/isc-dhcp-server /etc/default/isc-dhcp-server
sudo ifconfig wlan0 down
# set up wlan0 for static IP
sudo cp /home/pi/Pi_Setup/AP_Setup/interfaces /etc/network/interfaces
sudo ifconfig wlan0 192.168.42.1
# configure access point
sudo cp /home/pi/Pi_Setup/AP_Setup/hostapd.conf /etc/hostapd/hostapd.conf
sudo cp /home/pi/Pi_Setup/AP_Setup/hostetc /etc/default/hostapd
# configure network address translation
sudo cp /home/pi/Pi_Setup/AP_Setup/sysctl.conf /etc/sysctl.conf
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
# sudo cp ./interfaces /etc/network/interfaces	### already done ###
# update hostapd
#wget http://adafruit-download.s3.amazonaws.com/adafruit_hostapd_14128.zip
#unzip adafruit_hostapd_14128.zip
sudo mv /usr/sbin/hostapd /usr/sbin/hostapd.ORIG
sudo cp /home/pi/Pi_Setup/AP_Setup/hostapd /usr/sbin/
sudo chmod 755 /usr/sbin/hostapd
# set program as 'daemon'
#sudo ifup wlan0
sudo service hostapd start
sudo service isc-dhcp-server start
sudo update-rc.d hostapd enable
sudo update-rc.d isc-dhcp-server enable
# reboot?
# sudo reboot
