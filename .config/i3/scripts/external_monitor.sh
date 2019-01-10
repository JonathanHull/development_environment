#!/usr/bin/env sh

toggle_monitors () {
    monitors=`xrandr --listactivemonitors | wc -l`

    if [ $monitors -eq 2 ]; then
        xrandr --output eDP1 --mode 1920x1080 --output HDMI2 --mode 1920x1080 \
        --same-as eDP1
    else
        xrandr --output HDMI2 --off
    fi
}


toggle_monitors
