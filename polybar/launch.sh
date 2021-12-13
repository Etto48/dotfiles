#!/bin/bash
pkill polybar

if type "xrandr"; then
    PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [[ "${m}" = "${PRIMARY}" ]]; then
            MONITOR=$m polybar primary -r & disown
        else
            MONITOR=$m polybar secondary -r & disown
        fi
    done
else
    polybar primary -r & disown
fi
