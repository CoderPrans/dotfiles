#!/bin/bash

if [ -n "$1" ]; then
    if [ "$1" == "-d" ]; then
        if [ $(echo "$(light -G) > 10" | bc) -ne 0 ]; then
            light -U 10 && dialog.sh "  Brightness: $(light -G)%"
        else 
            notify-send "Brightness minimum"
        fi
    elif [ "$1" == "-i" ]; then
        light -A 10 && dialog.sh "  Brightness: $(light -G)%"
    else
        echo "incorrect flag"
    fi
else 
    echo "use '-i' to increase brightness & '-d' to decrease brightness"
fi
