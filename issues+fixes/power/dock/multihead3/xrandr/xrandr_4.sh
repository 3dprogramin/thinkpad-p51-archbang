#!/bin/sh
notify-send Multihead "Enabling laptop's display..."
xrandr --output VIRTUAL1 --mode VIRTUAL1.542-1920x1080 --primary --pos 0x0 --rotate normal --output eDP1 --mode 1920x1080 --pos 960x1080 --rotate normal --output VIRTUAL2 --mode VIRTUAL1.542-1920x1080 --pos 1920x0 --rotate normal --output VIRTUAL3 --off --output VIRTUAL4 --off --output VIRTUAL5 --off --output VIRTUAL6 --off --output VIRTUAL7 --off --output VIRTUAL8 --off --output VIRTUAL9 --off
