#!/bin/bash
# check if intel virtual output is running
sudo systemctl start bumblebeed
echo Started bumblebeed daemon

nvidia_driver=$(ps aux | grep nvidia | wc -l)
if [ $nvidia_driver -eq 1 ];
then
echo [+] Starting intel-virtual-output..
intel-virtual-output
echo [+] Started
else
echo [-] Intel virtual output already running
fi

xrandr --auto --output VIRTUAL1 --mode VIRTUAL1.543-1920x1080 --rate 60 --right-of eDP1

xrandr --auto --output DP-1-2-3 --mode 1280x720 --rate 60 --right-of eDP1
