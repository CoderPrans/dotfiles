#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar mybar &

# External monitor bar
# external_monitor=$(xrandr --query | grep 'HDMI-1')
# if [[ $external_monitor = *connected* ]]; then
#    polybar external &
# fi 

echo "Bar launched..."
