#!/bin/sh

# notify user what's about to happen
notify-send Multihead "Switching to external monitors..."

# TILDA
# --------------------------------------------------------------------------
killall tilda		# kill current tildas
tilda -c "htop" -x 1 &	# start tilda on monitor 1
# start 2nd tilda (we do it like this, because we want to control it with F3 not F2, this is a 'dummy' instance, will be killed later on)
# F2 is useful as it is, in renaming files / variables
sleep 1 && tilda &
# get PID of dummy instance
sleep 2 && TILDA_PID=`ps -ef --sort=start_time | grep tilda | tail -n 2 | head -n 1 | awk '{print $2}'`
# --------------------------------------------------------------------------

# kill redshift sessions
killall redshift

# start virtual output through GPU
optirun intel-virtual-output

# display to external monitors
bash /home/icebox/Documents/scripts/multihead/xrandr_1.sh
bash /home/icebox/Documents/scripts/multihead/xrandr_2.sh

# conky for 2nd monitor
conky -c ~/.config/conky/conky-monitor-2.conf &

# redshift for entire display
(sleep 8 && DISPLAY=:8 nohup redshift) &
# remove nohup file
(sleep 10 && rm nohup.out) &

# set 0 backlight to laptop display
(sleep 4 && notify-send Multihead "Switched monitors" && sleep 2 && xbacklight -set 0) &

# tilda, start 3nd one (with F3) and kill 2nd one started above
(sleep 10 && tilda -h -c "journalctl -f" -x 1920 -y 0) &
(sleep 12 && kill -9 $TILDA_PID && notify-send Multihead Ready) &