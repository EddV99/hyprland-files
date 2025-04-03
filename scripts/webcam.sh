#!/bin/bash
if ffplay -window_title webcam -fast /dev/video0 2> /dev/null; then
    notify-send "No webcam was found"
fi
