#!/bin/bash

function wallpaper() {
    echo "/home/edd/wallpaper/$1"
    echo ""
    if swww img /home/edd/wallpaper/$1 --transition-step 100 --transition-fps 30; then 
        echo "Setting $1 worked"
    else
        echo "Error setting $1"
    fi
}


if [ $# -eq 0 ]
then
    echo "Choosing a random wallpaper to set"
    IMG=$(ls /home/edd/wallpaper | shuf -n 1)
    wallpaper $IMG
else
    echo "wallpaper to set: $1"
    IMG=$1
    wallpaper $IMG
fi
