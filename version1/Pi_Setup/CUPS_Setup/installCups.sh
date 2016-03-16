#!/bin/bash
# install cups package
sudo apt-get install cups -y
# add user "pi" to a user group "lpadmin"
sudo usermod -a -G lpadmin pi
# modify config file
sudo cp ./cupsd.conf /etc/cups/cupsd.conf
# restart cups server
sudo /etc/init.d/cups restart
