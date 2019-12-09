#!/usr/bin/sh

wid=$1
class=$2
instance=$3
title=$(xwininfo -id $wid | sed -n '2p' | cut -d\" -f2)
border=$(bspc config border_width)

if [[ $instance = "vlc" && $title = "vlc" ]]; then
    echo layer=above border=off
fi
