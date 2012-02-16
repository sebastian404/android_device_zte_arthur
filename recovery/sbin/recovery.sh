#!/sbin/sh
#

##########################################
#History:
#when       whom            what, where, why
#--------   ----            ---------------------------------------------------
#2010-12-08 sebastian404    horrible, horrible hack
#2011-08-09 sebastian404    slighty better hack, but still horrible
##########################################

FTM_MODE=`/sbin/busybox cat /sys/devices/platform/android_usb/functions/ftm_mode`

if [[ $FTM_MODE = "disable" ]]
then
	/sbin/recovery
else
	/sbin/reboot recovery &
fi
