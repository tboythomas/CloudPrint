#!/bin/bash

sudo iwconfig wlan0 | grep $1 | wc -l
