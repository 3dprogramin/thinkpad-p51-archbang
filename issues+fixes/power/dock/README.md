Dock station
---

First the dock station has to be authorized.
That can be done with `bolt` program or using udev rule to [automatically connect any device](https://wiki.archlinux.org/index.php/Thunderbolt#Automatically_connect_any_device)

More information about dock station for thinkpad can be found on [arch linux site](https://wiki.archlinux.org/index.php/ThinkPad_docks)

### Configuration script

**For easier usage, I wrote a script that puts it all together (what's explained below), can be found here: `multihead/multihead.sh`**

**Multiple monitors**

I managed to get everything going through the dock, with two TV's, extended displays, no problem.

When my two Lenovo monitors arrived, it wasn't as easy.

I had to do it manually, through `arandr` like this:

- set VIRTUAL2 right next to eDP1, and active, apply **(IMPORTANT)**
- set VIRTUAL1 active, apply

**Use NVIDIA card for video outputs**

Start intel-virtual-output with optirun:

`optirun intel-virtual-output`

## Tips

**Health (eyes)**
Use `redshift` for maintaining the correct temperature (color) for your displays.
This should be done once everything was installed correctly and working (displays through HDMI and dock).
Install it with `sudo pacman -S redshift` and start it with `DISPLAY=:8 redshift -b 0.9:0.6` (`:8` is used because
bumblebee starts a display on it for the connected monitors). Check redshift's manual for more details

**Power saving**

I tried to disable the laptop's display with `arandr` and have only the monitors up, but system is lagging a lot if that's done. The solution I found was to have the 1st monitor clone the laptops display, and set the displays backlight to 0, at least to save some power, that's done with

`xbacklight -display :8 -set 0`

**nvidia-settings**

I almost never got a chance to actually get nvidia-settings running.

After using the external monitors with `optirun intel-virtual-output` (NVIDIA card), I was able to start the nvidia-settings with this command `optirun nvidia-settings -c :8`