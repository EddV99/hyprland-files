#!/bin/bash
# Create an associative array
declare -A sinks

# Get the list of sinks and their descriptions
sink_info=$(wpctl status | awk '/Audio/{a=1} /Sources:/{a=0} a && /Sinks:/{b=1; next} b && /Sources:/{b=0} b')

# Retrieve the names and descriptions using sed
ids=$(echo "$sink_info" | sed 's/[^0-9]*\([0-9]*\).*/\1/')

descriptions=$(echo "$sink_info" | sed 's/[^a-zA-Z]*//; s/\[.*\]//')

# Populate the associative array
IFS=$'\n' read -r -d '' -a ids_arr <<<"$ids"
IFS=$'\n' read -r -d '' -a descriptions_arr <<<"$descriptions"

for ((i = 0; i < ${#descriptions_arr[@]}; i++)); do
    sinks["${descriptions_arr[$i]}"]="${ids_arr[$i]}"
done

description=$(echo "$descriptions" | rofi -dmenu  -p "Select Default Audio Sink")

if [ -n "${description}" ]; then
    wpctl set-default "${sinks[${description}]}" &&
        notify-send --icon=notification-audio-volume-high "Default Audio Sink" "${description}" ||
        notify-send --icon=dialog-error "Couldn't set default audio sink!"
else
    echo "No sink selected. Default audio sink unchanged."
fi
