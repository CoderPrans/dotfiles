#!/usr/bin/sh

if [ "$(cat /sys/class/net/w*/operstate)" = 'up' ]; then
    echo "$(grep "^\s*w" /proc/net/wireless | awk '{ print "  ", int($3 * 100 / 70) "%" }')"
fi

if [ "$(cat /sys/class/net/e*/operstate)" = 'up' ]; then
    echo "$(sed "s/down//;s/up//" /sys/class/net/e*/operstate)"
fi
