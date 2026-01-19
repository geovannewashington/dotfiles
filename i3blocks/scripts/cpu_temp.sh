#!/usr/bin/env bash
for h in /sys/class/hwmon/hwmon*; do
    if [[ "$(cat "$h/name")" == "coretemp" ]]; then
        cat "$h/temp1_input" | awk '{printf "%.1f°C\n", $1/1000}'
    fi
done
