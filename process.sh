#!/bin/bash
#
# this is really slow on a pi - over 15 secs to do a dozen minutes
#
#--- to shoot snaps call this from cron --- 
#    #!/bin/bash
#    NOW=`date +%s`
#    fswebcam /home/pi/timelapse/out/${NOW}.jpg
#------------------------------------------------

# process jpg into a mp4 the mac can read natively
#    ref: https://medium.com/@sekhar.rahul/creating-a-time-lapse-video-on-the-command-line-with-ffmpeg-1a7566caf877

# note this uses 432x240 which is the default resolution above for this camera
# you can generate bigger ones by adding -r 1280x720 for example above
# and tuning the -s option below to whatever is actually generated
# (the 'file' command seems to report tht out)

today=`date +%Y%m%d`

# today="20240114"   # uncomment to manually run one day

indir="/home/pi/timelapse/out.${today}"
outdir="/home/pi/timelapse/movies"

if [ -d ${indir} ]
then
  if [ -d ${outdir} ]
  then
    logger -t "[PROCESS_SNAPS]" "start processing ${today}"
    ffmpeg -y \
     -framerate 30 \
     -pattern_type glob -i "${indir}/*.jpg" \
     -s:v 432x240 \
     -c:v libx264 \
     -crf 17 \
     -pix_fmt yuv420p \
        ${outdir}/timelapse-${today}.mp4
   else
    logger -t "[PROCESS_SNAPS]" "can't open ${outdir} for write"
  fi
  logger -t "[PROCESS_SNAPS]" "done processing ${today}"
else
  logger -t "[PROCESS_SNAPS]" "can't open ${indir} for read"
fi
