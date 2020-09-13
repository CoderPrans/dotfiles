#!/bin/sh

print_xkb() {
    echo "$(xkb-switch -p | sed 's/hin-kagapa/kgp/')"
}

print_wifi() {
    # wlp=$(grep "^\s*w" /proc/net/wireless | awk '{print $1}')

    # if [ $wlp == "wlp6s0:" ]; then
    #     echo 📶
    # else
    #     echo 
    # fi
    # nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -c5- 
    [ "$(cat /sys/class/net/w*/operstate)" = 'down' ] && wifiicon="📡" ||
	wifiicon=$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70) "%" }')

    printf "%s %s\n" "$wifiicon" "$(sed "s/down//;s/unknown/teth/;s/up//" /sys/class/net/e*/operstate)"
}

print_mem() {
    echo " $(free --mebi | sed -n '2{p;q}' | awk '{print ($3/$2)*100}' | cut -c1-2)%"
}

print_batstatus() {
    # status=$(acpi -b | awk '{print $3}')
    status=$(cat /sys/class/power_supply/BAT0/status)
    case $status in
        "Charging")
            echo 
            ;;
        "Discharging")
            echo  
            ;;
        *)
    esac
}
print_bat() {
    # acpi -b | sed -ne 's/^.*ging,//p' | cut -c2-4
    echo "$(cat /sys/class/power_supply/BAT0/capacity)%"
}

print_date() {
    date "+%a %d, %R" 
}

while true; do
    xsetroot -name " $(print_xkb) $(print_wifi) $(print_mem) $(print_batstatus) $(print_bat) $(print_date)"
    # echo $(print_wifi) $(print_batstatus) $(print_bat) $(print_date) sleep 5   # 1m for time every minute
    sleep 1
done &

