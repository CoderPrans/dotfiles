#!/bin/sh

print_xkb() {
    echo "$(xkb-switch -p | sed 's/hin-kagapa/kgp/')"
}

print_wifi() {
    if [ "$(cat /sys/class/net/w*/operstate)" = 'up' ]; then
        echo "$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70) "%" }')"
    elif [ "$(cat /sys/class/net/e*/operstate)" != 'down' ]; then
        echo "$(sed "s/down//;s/unknown/teth/;s/up//" /sys/class/net/e*/operstate)"
    else
        echo "📡" 
    fi
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
    xsetroot -name " $(print_xkb) $(print_mem) $(print_wifi) $(print_batstatus) $(print_bat) $(print_date)"
    # echo $(print_wifi) $(print_batstatus) $(print_bat) $(print_date) sleep 5   # 1m for time every minute
    sleep 1
done &

