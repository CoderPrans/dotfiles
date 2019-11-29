#!/bin/bash

if [ -z "$1" ] ; then
    echo "NO message provided"
else
    echo "Message: " "$1"
    notify-send -u low -t 500 "$1"
fi

