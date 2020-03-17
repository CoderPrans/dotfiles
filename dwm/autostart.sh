#!/bin/sh

nitrogen --restore &
xss-lock -- blurlock.sh -d &
blueman-applet &
nm-applet &

# Statusbar loop
# while true; do
#     xsetroot -name " $(acpi -b | sed -ne 's/^.*ging,//p' | cut -c1-4) $(date +" %a %d, %R" )"
#    sleep 1m   # Update time every minute
# done &

dwm_status.sh &

