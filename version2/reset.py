# Reset Button File. If the reset button hold more than 5 secs, reset
# to Router Mode.
# @Usage: GPIO pin 23

import RPi.GPIO as GPIO
import os, time

#set up GPIO using BCM numbering
GPIO.setmode(GPIO.BCM)
#setup GPIO using Board numbering
GPIO.setmode(GPIO.BOARD)

GPIO.setup(23, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

while True:
	if(GPIO.input(23)):		
		pressedTime = time.monotonic()
		while(GPIO.input(23)):
			pass
		pressedTime = time.monotonic() - pressedTime
		if pressedTime >= 5:
			os.system("sudo /home/pi/Pi_Setup/AP_Setup/toRouter.sh")
	GPIO.cleanup()