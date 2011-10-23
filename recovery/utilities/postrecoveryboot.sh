#!/sbin/sh

sleep 2

# on Liberty, `ps` while power on:
#   73 root       436 S    /sbin/offmode_charging
#   74 root       252 S    /sbin/detect_key
#
# while power off:
#   73 root       444 S    /sbin/offmode_charging
#   74 root       264 S    /sbin/detect_key
#
if [ ! -x /sbin/offmode_charging ] \
|| [ "$(ps | grep '436 S */sbin/offmode_charging')" ]
then
    echo 200 > /sys/class/leds/button-backlight/brightness
fi
