#!/bin/bash
sudo chown pi:pi /mnt/ramdisk/motion/image.jpg
fswebcam -r 640x840 /mnt/ramdisk/motion/image.jpg

