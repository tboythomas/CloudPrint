"""
    This program reset the pi to router mode
"""
import RPi.GPIO as GPIO
import time, os

# hold time for toRouter
HOLDTIME = 5
# input pin number
INPUT = 18

GPIO.setmode(GPIO.BCM)

GPIO.setup(INPUT, GPIO.IN, pull_up_down=GPIO.PUD_UP)

while True:
    input_state = GPIO.input(INPUT)
    if input_state == False:
        print("button pressed " + str(input_state))
        start_time = time.monotonic()
        while input_state == False:
            pressed_time = time.monotonic() - start_time
            if pressed_time >= HOLDTIME:
		print ('deleting printers')
		os.system("sudo /home/pi/Pi_Setup/removePrinters.sh")
                print('changing to router')
                os.system("sudo /home/pi/Pi_Setup/AP_Setup/toRouter.sh")
                break
        break
print("clean up")
GPIO.cleanup()

