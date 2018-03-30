#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread
exec &> "/data/CNS.log"

if [ ! -f "/data/CNSvalues.txt" ]; then
	touch "/data/CNSvalues.txt"
	printf '%s\n' 'def=180' 'a=180' 'b=420' 'c=900' 'd=1440' > "/data/CNSvalues.txt"
fi

source "/data/CNSvalues.txt"
sleep 15

su -c 'settings put global notification_snooze_options "default='"$def"',options_array='"$a"':'"$b"':'"$c"':'"$d"'"'