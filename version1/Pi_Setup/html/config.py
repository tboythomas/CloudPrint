#!/usr/bin/python
import os, sys

def main(argv):
	# argv = [name, password, email, printer]
	wifi_cmd = "sudo ./wifi_login.sh " + argv[0] + " " + argv[1]
	os.system(wifi_cmd)
	cloudprint_cmd = "sudo ./connector.sh " + argv[2] + " " + argv[3]
	os.system(cloudprint_cmd)

if __name__ == "__main__":
	if len(sys.argv) != 5:
		print "Not enough arguments"
	main(sys.argv[1:])
