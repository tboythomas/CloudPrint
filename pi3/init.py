#!/usr/bin/python
import os

def main():
	# update and upgrade system
	os.system("sudo apt-get update")
	print("\nSYSTEM UPDATED\n")
	os.system("sudo apt-get upgrade -y")
	print("\nSYSTEM UPGRADED\n")
	# replace /etc/network/interfaces file to safely remove dhcpcd5 package
	os.system("sudo cp /home/pi/Pi_Setup/client_Setup/interfaces.client /etc/network/interfaces")
	print("\nNETWORK INTERFACE MODIFIED\n")
	# remove dhcpcd5 package
	os.system("sudo apt-get remove dhcpcd5 -y")
	print("\nDHCPCD5 PACKAGE REMOVED\n")
	# install packages
	install_cups()
	install_apache2_php5()
	install_connector()
	# give permission to web server scripts to properly run php5
	os.system("sudo sh -c 'echo \"www-data ALL=NOPASSWD: /var/www/html/\" >> /etc/sudoers'")
	os.system("sudo sh -c 'echo \"www-data ALL=NOPASSWD: /home/pi/Pi_Setup/AP_Setup/\" >> /etc/sudoers'")
	os.system("sudo sh -c 'echo \"www-data ALL=NOPASSWD: /home/pi/Pi_Setup/client_Setup/\" >> /etc/sudoers'")
	os.system("sudo sh -c 'echo \"www-data ALL=NOPASSWD: /home/pi/Pi_Setup/cloudprint_Setup/\" >> /etc/sudoers'")
	os.system("sudo sh -c 'echo \"www-data ALL=NOPASSWD: /home/pi/Pi_Setup/\" >> /etc/sudoers'")
	# change permission of files
	os.system("sudo chmod 744 /home/pi/Pi_Setup/AP_Setup/toRouter.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/client_Setup/checkWifi.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/client_Setup/switchToWlanClient.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/client_Setup/wifi_login.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/cloudprint_Setup/addPrinter.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/cloudprint_Setup/cloudPrint.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/cloudprint_Setup/connector.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/cloudprint_Setup/printFail.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/cloudprint_Setup/print.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/cloudprint_Setup/removeOnePrinter.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/removePrinters.sh")
	os.system("sudo chmod 744 /home/pi/Pi_Setup/verify.sh")
	# edit rc.local
	os.system("sudo sed -i '19c sudo python3 /home/pi/Pi_Setup/reset.py &' /etc/rc.local")
	# configure into access point
	to_access_point()
	os.system("sudo python3 /home/pi/Pi_Setup/reset.py &")
	
def install_cups():
	# install cups package
	os.system("sudo apt-get install cups -y")
	# add user "pi" to a user group "lpadmin"
	os.system("sudo usermod -a -G lpadmin pi")
	# modify config file
	os.system("sudo cp /home/pi/Pi_Setup/CUPS_Setup/cupsd.conf /etc/cups/cupsd.conf")
	# restart cups server
	os.system("sudo /etc/init.d/cups restart")
	print("\nUPDATE: CUPS INSTALLED\n")

def install_apache2_php5():
	# install apache2 package
	os.system("sudo apt-get install apache2 apache2-utils -y")
	# install php5 package
	os.system("sudo apt-get install php5 -y")
	print("\nUPDATE: APACHE2 & PHP5 INSTALLED\n")
	# copy web page files to apache2 web server folders
	os.system("sudo cp -r /home/pi/Pi_Setup/web_Server/* /var/www/html/.")
	os.system("sudo rm /var/www/html/index.html")
	print("\nUPDATE: WEB PAGES ADDED\n")

def install_connector():
	# install dependencies
	os.system("sudo apt-get install libcups2 libavahi-client3 avahi-daemon libsnmp30 -y")
	# download and extract binaries
	#os.system("wget https://github.com/google/cups-connector/releases/download/2016.01.02/gcp-cups-connector-rpi-jessie-2016.01.02.tar.gz")
	os.system("tar -xzvf /home/pi/Pi_Setup/cloudprint_Setup/gcp-cups-connector-rpi-jessie-2016.01.02.tar.gz")
	#os.system("rm /home/pi/Pi_Setup/gcp-cups-connector-rpi-jessie-2016.01.02.tar.gz")
	# create an unprivileged gcp system user
	os.system("sudo useradd -s /usr/sbin/nologin -r -M gcp")
	# create /opt/gcp_cups_connector
	os.system("sudo mkdir /opt/gcp_cups_connector")
	# move the binaries to /opt/gcp_cups_connector
	os.system("sudo mv /home/pi/Pi_Setup/cups-connector/gcp-cups-connector /opt/gcp_cups_connector")
	os.system("sudo mv /home/pi/Pi_Setup/cups-connector/gcp-cups-connector-util /opt/gcp_cups_connector")
	# remove unneeded folder
	os.system("rmdir /home/pi/Pi_Setup/cups-connector/")
	# make sure binaries are executable
	os.system("sudo chmod 755 /opt/gcp_cups_connector/gcp-cups-connector")
	os.system("sudo chmod 755 /opt/gcp_cups_connector/gcp-cups-connector-util")
	# change the owner of the binaries to gcp
	os.system("sudo chown gcp:gcp /opt/gcp_cups_connector/gcp-cups-connector")
	os.system("sudo chown gcp:gcp /opt/gcp_cups_connector/gcp-cups-connector-util")
	# copy the gcp service file to /etc/systemd/system
	os.system("sudo cp /home/pi/Pi_Setup/cloudprint_Setup/gcp.service /etc/systemd/system")
	# change the file permissions
	os.system("sudo chmod 664 /etc/systemd/system/gcp.service")
	# change the owner to root
	os.system("sudo chown root:root /etc/systemd/system/gcp.service")
	print("\nUPDATE: GOOGLE CUPS CONNECTOR INSTALLED\n")

def to_access_point():
	# install web server packages
	os.system("sudo apt-get install hostapd -y")
	os.system("sudo apt-get install isc-dhcp-server")
	# running bash script - configuration
	os.system("sudo /home/pi/Pi_Setup/AP_Setup/toRouter.sh")
	print("\nUPDATE: CONVERTED TO ACCESS POINT\n")

if __name__ == '__main__':
	main()
