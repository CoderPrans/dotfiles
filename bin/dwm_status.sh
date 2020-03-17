#!/bin/sh

print_wifi() {
    # wlp=$(grep "^\s*w" /proc/net/wireless | awk '{print $1}')

    # if [ $wlp == "wlp6s0:" ]; then
    #     echo " "
    # else
    #     echo "" 
    # fi
   nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -c5- 
}

print_bat() {
    acpi -b | sed -ne 's/^.*ging,//p' | cut -c1-4
}

print_date() {
    date "+%a %d, %R" 
}

while true; do
    xsetroot -name " $(print_wifi) $(print_bat) $(print_date)"
    sleep 1m   # Update time every minute
done &


