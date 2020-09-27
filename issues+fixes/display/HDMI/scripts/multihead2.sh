#!/bin/bash

# start bumblebeed daemon
# we don't use `system enable` because of bug with cursor tearring (and others)
sudo systemctl start bumblebeed
echo Started bumblebeed daemon

# check if intel virtual output is running
nvidia_driver=$(ps aux | grep nvidia | wc -l)
if [ $nvidia_driver -eq 1 ];
then
echo [+] Starting intel-virtual-output..
intel-virtual-output
echo [+] Started
else
echo [-] Intel virtual output already running
fi

# initial switch (required for things to work)
echo [+] Doing initial switch to VIRTUAL1
xrandr --auto --output VIRTUAL1

# set real resolutions
echo [+] Setting resolutions..
sleep 2
xrandr --auto --output VIRTUAL2 --mode VIRTUAL2.552-1920x1080 --rate 59.94* --right-of eDP1
sleep 2
xrandr --auto --output VIRTUAL1 --mode VIRTUAL1.543-1920x1080 --rate 60.00 --right-of VIRTUAL2
echo [+] Resolutions set !

# handle audio
#sleep 1
echo [+] Configuring audio...
#sleep 4
echo [+] Audio configured !

# pacmd list-sinks
# pacmd list-sources

# required only once
#pactl set-card-profile 0 output:analog-stereo
#pacmd set-default-sink 0
#pacmd set-default-source 0
