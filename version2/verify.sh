#!/bin/bash
serial=`cat /proc/cpuinfo | grep Serial | cut -d ':' -f 2`
verified=`grep $serial /home/pi/Pi_Setup/serialList.txt | wc -l`
echo $verified
