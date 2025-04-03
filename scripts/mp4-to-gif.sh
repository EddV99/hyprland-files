#!/bin/sh

function Help(){
    echo "Utility to convert a MP4 to GIF"
    echo "Usage: mp4-to-gif [FPS] [WIDTH] [OUTPUT] [LENGTH] [FILE]"
}

if [ $# -eq 0 ]; then
    Help
    exit 1
fi

FPS=$1
WIDTH=$2
OUTPUT=$3
TIME=$4
FILE=$5

ffmpeg -ss 0 -t $TIME -i $FILE \
    -vf "fps=${FPS},scale=${WIDTH}:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 "${OUTPUT}.gif"
