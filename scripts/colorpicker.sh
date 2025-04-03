#!/bin/sh

# pick a color
COLOR=$(hyprpicker)

# exit if none chosen
[ -z "$COLOR" ] && exit

# copy to clipboard
printf "$COLOR" | wl-copy




