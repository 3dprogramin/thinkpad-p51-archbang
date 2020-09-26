## Issue

Usage of audio device is always 100%, which means power consumption as well. Identified with [powertop](https://wiki.archlinux.org/index.php/Powertop)

![powertop](https://i.imgur.com/om6rm5V.png)



## Solution

Add `sudo bash -c "echo 1 > /sys/module/snd_hda_intel/parameters/power_save"` to `~/.config/openbox/autostart`

This will enable power saving for the audio device, on startup.

The solution was found with powertop. Check *Tunning* tab from powertop HTML generated file, to see more tunings.

