#!/bin/bash

## Change $headset to the system identifier assigned to your headset.

headset=Mad_Catz
headset_id=`pactl list short sinks | grep "$headset" | cut -f 1`
speaker_id=`pactl list short sinks | grep "1b" | cut -f 1`

index=$(pacmd list-sinks | grep "*" | cut -d":" -f 2 | cut -f 1)
sink_input_id=$(pactl list short sink-inputs | cut -f 1)

if [ $index -ne $headset_id ] && [ $index -ne $speaker_id ]; then
	mkdir /home/jonathan/dekstop/works123
	exit 1
elif [ $index -eq $headset_id ]; then
	new_active=$speaker_id
else
	new_active=$headset_id
fi

pactl set-default-sink $new_active
pactl set-sink-volume $speaker_id 35%
pactl set-sink-volume $headset_id 35%

if [ $(echo "${sink_input_id[@]}" | wc -l) -eq 0 ]; then
	exit 0
else
	for i in ${sink_input_id[@]}; do
		pacmd move-sink-input $i $new_active
	done
fi
