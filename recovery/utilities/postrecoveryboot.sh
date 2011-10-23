#!/sbin/sh

OFFMODE_BTN=1

# by the time this script runs, /etc/fstab hasn't been created yet.
FSTAB=`grep $ANDROID_DATA /etc/recovery.fstab \
    | awk '{if($1=="'"$ANDROID_DATA"'")print $2,$3}'`
if [ -n "$FSTAB" ]; then
    FS=`echo "$FSTAB" | awk '{print $1}'`
    MTD=`echo "$FSTAB" | awk '{print $2}'`
    BLOCK=$MTD
    if [ -z "$(echo $MTD | sed 's#[^/]##g')" ]; then
        BLOCK=`grep \"$MTD\" < /proc/mtd \
            | sed -e 's#:.*##' -e 's#mtd#/dev/block/mtdblock#'`
    fi
    if [ -b "$BLOCK" ] && mount -r -t $FS $BLOCK $ANDROID_DATA; then
        for PROP in $(find /data/property/ -type f -name persist.recovery.*); do
            KEY=`basename $PROP`
            VAL=`cat $PROP`
            case "$KEY" in
                persist.recovery.offmode.button-backlight)
                    OFFMODE_BTN=$VAL
                    ;;
            esac
            setprop "$KEY" "$VAL"
        done
        umount $ANDROID_DATA
    fi
fi

# on Liberty, `ps` while power on:
#   73 root       436 S    /sbin/offmode_charging
#   74 root       252 S    /sbin/detect_key
#
# while power off:
#   73 root       444 S    /sbin/offmode_charging
#   74 root       264 S    /sbin/detect_key
#
# backlight is lighted up by init.rc
if [ -n "$(ps | grep '444 S */sbin/offmode_charging')" ] \
&& [ "$OFFMODE_BTN" = 0 ]
then
    echo 0 > /sys/class/leds/button-backlight/brightness
fi
