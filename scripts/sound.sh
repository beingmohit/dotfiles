#/bin/bash

for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`; do
    	
    if [[ $1 == "increase" ]]; then
        pactl set-sink-volume $SINK +5%;
	pactl set-sink-mute $SINK 0;
    elif [[ $1 == "decrease" ]]; then 
	pactl set-sink-volume $SINK -5%;
        pactl set-sink-mute $SINK 0;
    elif [[ $1 == "mute" ]]; then 
    	pactl set-sink-mute $SINK toggle;
    else 
    	echo "Unknown Command";
    fi

done
