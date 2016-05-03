"""
    This program reset the pi to router mode
"""
import RPi.GPIO as GPIO
import time

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
                print('ssudo ./toRouter.sh')
                break
        break
print("clean up")
GPIO.cleanup()

