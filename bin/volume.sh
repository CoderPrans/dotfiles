#!/bin/sh

function currvolume {
    pactl list sinks \
        | grep 'front-right:' \
        | awk '{print $12}'
}

function ismute {
    pactl list sinks \
        | grep Mute: \
        | awk '{print $2}'
}

function togglemute {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
}

function adjustmute {
    pactl set-sink-mute @DEFAULT_SINK@ 0
}

if [ -n "$1" ]; then
    if [ "$1" == "-i" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +10% \
            && dialog.sh "  Volume: `currvolume`" \
            && adjustmute
    elif [ "$1" == "-d" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ -10% \
            && dialog.sh "  Volume: `currvolume`" \
            && adjustmute
    elif [ "$1" == "-x" ]; then
        if [ `ismute` == "no" ] ; then
            togglemute && dialog.sh '  Muted'
        else
            togglemute && dialog.sh '  Unmuted'
        fi
    else
        echo "incorrect flag"
    fi
else 
    echo "Usage: volume.sh -i|d|x"
fi
