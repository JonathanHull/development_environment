#!/usr/bin/env sh
# Shell script to prepend status bar with backlight percentage

function round() {
    echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc));
};

echo $(round `xbacklight`/1 0);
