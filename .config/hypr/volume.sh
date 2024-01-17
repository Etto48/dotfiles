#!/bin/bash

if [ $1 == "inc" ]; then
    wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+
elif [ $1 == "dec" ]; then
    wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-
elif [ $1 == "mute" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
fi
