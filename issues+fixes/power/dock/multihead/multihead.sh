#!/bin/sh

# notify user what's about to happen
notify-send Multihead "Switching to external monitors..."

# kill tildas
(killall tilda && sleep 1 && tilda -c "htop" -x 1) &

# kill redshift sessions
killall redshift

# start virtual output through GPU
optirun intel-virtual-output

# display to external monitors
bash /home/icebox/Documents/scripts/multihead/xrandr_1.sh
bash /home/icebox/Documents/scripts/multihead/xrandr_2.sh

# conky for 2nd monitor
(sleep 3 && conky -c ~/.config/conky/conky-monitor-2.conf) &

# redshift for entire display
(sleep 8 && DISPLAY=:8 nohup redshift) &
# remove redshift nohup file
(sleep 10 && rm nohup.out) &
# set 0 backlight to laptop display
(sleep 3 && notify-send Multihead "Ready" && sleep 2 && xbacklight -set 0) &
# tilda
(sleep 10 && tilda -h -c "journalctl -f" -x 1920 -y 0) &
