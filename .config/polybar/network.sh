#!/usr/bin/sh

if [ "$(cat /sys/class/net/w*/operstate)" = 'up' ]; then
    echo "$(grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70) "%" }')"
elif [ "$(cat /sys/class/net/e*/operstate)" != 'down' ]; then
    echo "$(sed "s/down//;s/unknown//;s/up//" /sys/class/net/e*/operstate)"
else
    echo "" 
fi
