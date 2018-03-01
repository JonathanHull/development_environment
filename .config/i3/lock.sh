#!/bin/bash

scrot /tmp/screen.png

convert /tmp/screen.png -paint 3 /tmp/screen.png
convert /tmp/screen.png /home/$USER/.config/i3/lock/lock.png -gravity center -composite -matte /tmp/screen.png

#mocp -P
i3lock -u -e -i /tmp/screen.png
