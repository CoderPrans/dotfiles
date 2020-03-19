#!/bin/sh

print_wifi() {
    # wlp=$(grep "^\s*w" /proc/net/wireless | awk '{print $1}')

    # if [ $wlp == "wlp6s0:" ]; then
    #     echo 
    # else
    #     echo 
    # fi
   nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -c5- 
}

print_batstatus() {
    status=$(acpi -b | awk '{print $3}')
    case $status in
        "Charging,")
            echo  
            ;;
        "Discharging,")
            echo  
            ;;
        *)
    esac
}
print_bat() {
    acpi -b | sed -ne 's/^.*ging,//p' | cut -c2-4
}

print_date() {
    date "+%a %d, %H:%M:%S" 
}

while true; do
    xsetroot -name " $(print_wifi)  $(print_batstatus) $(print_bat)  $(print_date)"
    sleep 1   # Update time every minute
done &

