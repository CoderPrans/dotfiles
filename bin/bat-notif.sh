#!/bin/bash

acpi --battery \
    | awk -F, '/Discharging/ {if (int($2) < 20) print }' \
    | sed -n -e 's/^.*Discharging,//p' \
    | xargs -ri env Display=:0 notify-send -u critical -t 3000 {}
