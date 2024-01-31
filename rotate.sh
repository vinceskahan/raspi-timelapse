#!/bin/bash

today=`date +%Y%m%d`
fromdir="/home/pi/timelapse/out"
todir="/home/pi/timelapse/out.${today}"

if [ -d ${fromdir} ]
then
   logger -t "[PROCESS_SNAPS]" "renaming ${fromdir} to ${todir}"
   mv ${fromdir} ${todir}
else
  logger -t "[PROCESS_SNAPS]" "${fromdir} not found"
  exit 1
fi
logger -t "[PROCESS_SNAPS]" "making new ${fromdir}"
mkdir -p ${fromdir}
