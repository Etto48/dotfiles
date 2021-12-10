#!/bin/bash
pkill polybar

if type "xrandr"; then
    PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [[ "${m}" = "${PRIMARY}" ]]; then
            MONITOR=$m polybar --reload primary & disown
        else
            MONITOR=$m polybar --reload secondary & disown
        fi
    done
else
    polybar --reload primary & disown
fi
