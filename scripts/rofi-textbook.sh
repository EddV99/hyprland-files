#!/bin/sh

path=~/Library/Textbooks
choice=$(ls $path | rofi -dmenu -i -p "Read: ")
if [[ ! -z $choice ]]; then
    ext="${choice#*.}"
    if [ "$ext" = "epub" ]; then 
      foliate $path/$choice
    else
      evince $path/$choice
    fi
fi


