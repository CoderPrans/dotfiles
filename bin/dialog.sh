#!/bin/bash

if [ -z "$1" ] ; then
    echo "NO message provided"
else
    echo "Message: $*"
    notify-send -u low -t 500 "$*"
fi

