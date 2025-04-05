#!/bin/bash

choice=$1
echo $choice

function notifyBrightness() {
  val=$(brightnessctl g)
  max=$(brightnessctl m)
  percentage=$(( (val * 100) / max ))
  dunstify -r 23 -h int:value:$percentage "☀️ Brightness 🌞"
}

if [ "$choice" == "volume-up" ]; then
  wpctl set-volume @DEFAULT_SINK@ 1%+
elif [ "$choice" == "volume-down" ]; then
  wpctl set-volume @DEFAULT_SINK@ 1%-
elif [ "$choice" == "volume-mute" ]; then
  wpctl set-mute @DEFAULT_SINK@ toggle
elif [ "$choice" == "mic-mute" ]; then
  wpctl set-mute @DEFAULT_SOURCE@ toggle
elif [ "$choice" == "brightness-up" ]; then
  brightnessctl s 10%+
  notifyBrightness
elif [ "$choice" == "brightness-down" ]; then
  brightnessctl s 10%-
  notifyBrightness
fi
