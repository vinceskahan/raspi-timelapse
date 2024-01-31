
## Timelapse movies from snapshots on a pi

crontab files and scripts from the timelapse webcam pi

* snap.sh - take snapshot and save to a file to be processed into timelapse
* fake-snap.sh - similarly do one to be grabbed for using in weewx
* process.sh - process a directory of snapshots into a timelapse
* rotate.sh - rotate the output directories after the day is done
* crontab.pi - pi user's crontab
* crontab.root - root's crontab
* fstab.tmpfs - do things in ramdisk to save on SD writes

Not a lot of commentary here so read the short scripts for details.

