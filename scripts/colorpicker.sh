#!/bin/sh

# pick a color
COLOR=$(hyprpicker)

# exit if none chosen
[ -z "$COLOR" ] && exit

notify-send -t 2000 "🗿 Copied to Clipboard 🗿"
# copy to clipboard
printf "$COLOR" | wl-copy




