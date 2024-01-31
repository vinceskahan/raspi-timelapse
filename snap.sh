#!/bin/bash
NOW=`date +%s`
fswebcam --line-color "##FF000000" /home/pi/timelapse/out/${NOW}.jpg

# turn off default red line color

