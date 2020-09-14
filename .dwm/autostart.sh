#!/bin/sh

#urxvtd &
setxkbmap us,in -variant ,hin-kagapa -option grp:alt_caps_toggle
compton &
nm-applet &
blueman-applet &
xss-lock -- blurlock.sh -d &
feh --bg-scale "$(cat ~/.local/mybg)" &
#nitrogen --restore &

# Statusbar loop
# while true; do
#     xsetroot -name " $(acpi -b | sed -ne 's/^.*ging,//p' | cut -c1-4) $(date +" %a %d, %R" )"
#    sleep 1m   # Update time every minute
# done &

dwm_status.sh &

