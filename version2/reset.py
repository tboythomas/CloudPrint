"""
    This program reset the pi to router mode
"""
import RPi.GPIO as GPIO
import time, os

# hold time for toRouter
HOLDTIME = 5
# input pin number
INPUT = 26

GPIO.setmode(GPIO.BCM)

GPIO.setup(INPUT, GPIO.IN, pull_up_down=GPIO.PUD_UP)

while True:
    if GPIO.input(INPUT) == False:
        print("button pressed ")
        start_time = time.monotonic()
        while GPIO.input(INPUT) == False:
            pass   
        pressed_time = time.monotonic() - start_time
        if pressed_time >= HOLDTIME:
            print ('deleting printers')
            os.system("sudo /home/pi/Pi_Setup/removePrinters.sh")
            print('changing to router')
            os.system("sudo /home/pi/Pi_Setup/AP_Setup/toRouter.sh")
GPIO.cleanup()

