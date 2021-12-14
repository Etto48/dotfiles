#!/bin/bash

function get_monitors()
{
    xrandr | grep " connected" | cut -d " " -f1
}

function get_offline_monitors()
{
    xrandr | grep "disconnected" | cut -d " " -f1
}

function get_best_res()
{
    xrandr | grep -A 1 "$1" | grep -v "$1" | cut -d " " -f4
}

function configure_monitor() 
{
    MONITOR_LIST=$(get_monitors)
    LAST_MONITOR=""
    COMMAND_STRING=""
    for MON in $MONITOR_LIST
    do
        if [[ "${LAST_MONITOR}" = "" ]]; then
            COMMAND_STRING="$COMMAND_STRING --output $MON --mode $(get_best_res ${MON}) --primary"
        else
            COMMAND_STRING="$COMMAND_STRING --output $MON --mode $(get_best_res ${MON}) --left-of $LAST_MONITOR"
        fi   
        LAST_MONITOR=$MON
    done
    MONITOR_LIST=$(get_offline_monitors)
    for MON in $MONITOR_LIST
    do
        COMMAND_STRING="$COMMAND_STRING --output $MON --off"
    done
    xrandr $COMMAND_STRING
}

configure_monitor
feh --bg-scale ~/Pictures/wallpaper.jpg
~/.config/polybar/launch.sh
