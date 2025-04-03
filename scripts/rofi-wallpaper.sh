#!/bin/sh

CHOOSE=$(ls ~/wallpaper/ | rofi -dmenu -i -p "Wallpaper: ")
if [[ ! -z $CHOOSE ]]
then
    change-wallpaper.sh $CHOOSE
fi


