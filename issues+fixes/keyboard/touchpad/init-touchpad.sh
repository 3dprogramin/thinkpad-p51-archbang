#!/usr/bin/bash

# enable tapping
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
# enable scrolling as on windows (natural scrolling config)
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1
# set accelaration to .5
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Accel Speed" .7

# set trackpoint acceleration to .3
xinput set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' .3
