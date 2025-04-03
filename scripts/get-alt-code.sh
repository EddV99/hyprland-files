#!/bin/bash
#  💯 🥶

path=~/Documents/script-data/alt-codes.txt
if ! [ -f $path ]
then
  echo "Couldn't find alt codes file, exiting..."
  exit 1
fi

quoted_strings=$(awk '{print}' $path | sed 's/"(.*?)"/\n/g' | sed 's/\"/ /g')

# Use readarray to put each line (quoted string) into an array
readarray -t descriptions <<< "$quoted_strings"

function entries()
{
  for i in "${descriptions[@]}"
  do
    echo "$i"
  done
}

choice=$(entries | rofi -dmenu -i -p "Copy a Symbol" | awk '{print $1}')
wl-copy -n $choice
notify-send "Copied to Clipboard $choice"

exit 0
