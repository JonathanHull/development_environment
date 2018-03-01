#!/bin/bash

## check out pacmd list-sinks 
## Won't need to have active audio for the generated scripts.

active_device=$(pacmd list-sinks | grep "*" | cut -d":" -f 2 | cut -f 1)
change=${1:0:1}

if [[ ${1:1:1} -eq mute ]]; then
	pactl set-sink-mute $active_device toggle
else
	pactl set-sink-volume $active_device "$change"5%
fi

exit 0
