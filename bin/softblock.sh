#!/bin/sh

function checkwifi {
    rfkill list \
        | sed -n '/Wireless/,/Soft/p' \
        | awk '{print $3}' | xargs \
        | awk '{print $NF}'
}

function checkbluetooth {
    rfkill list \
        | sed -n '/Bluetooth/,/Soft/p' \
        | awk '{print $3}' | xargs \
        | awk '{print $NF}'
}

if [ -n  "$1" ]; then
    if [ "$1" == "-w" ]; then
        if [ `checkwifi` == "no" ]; then
            rfkill block wifi \
                && dialog.sh " Wifi OFF "
        elif [ `checkwifi` == "yes" ]; then
            rfkill unblock wifi \
                && dialog.sh " Wifi ON "
        fi
    elif [ "$1" == "-b" ]; then
        if [ `checkbluetooth` == "no" ]; then
            rfkill block bluetooth \
                && dialog.sh " Bluetooth OFF "
        elif [ `checkbluetooth` == "yes" ]; then
            rfkill unblock bluetooth \
                && dialog.sh " Bluetooth ON "
        fi
    fi
else
    echo "Usage: softblock.sh -w|b"
fi
