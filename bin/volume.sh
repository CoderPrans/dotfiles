#!/bin/bash

if [ -n "$1" ]; then
    if [ "$1" == "-i" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +10% \
            && dialog.sh \
            "  Volume: $(echo `pactl list sinks | grep 'front-right:' | awk '{print $12}'`)" \
            && pactl set-sink-mute @DEFAULT_SINK@ 0
    elif [ "$1" == "-d" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ -10% \
            && dialog.sh \
            "  Volume: $(echo `pactl list sinks | grep 'front-right:' | awk '{print $12}'`)" \
            && pactl set-sink-mute @DEFAULT_SINK@ 0
    elif [ "$1" == "-x" ]; then
        if [ "$(echo `pactl list sinks | grep Mute: | awk '{print $2}'`)" == "no" ] ; then
            pactl set-sink-mute @DEFAULT_SINK@ toggle && dialog.sh '  Muted'
        else
            pactl set-sink-mute @DEFAULT_SINK@ toggle && dialog.sh '  Unmuted'
        fi
    else
        echo "incorrect flag"
    fi
else 
    echo "use '-i' to increase volume, '-d' to decrease volume & 'x' to toggle mute"
fi
