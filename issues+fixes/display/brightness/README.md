## Issue
Cannot set brightness of display

Neither from keyboard nor using ```xbacklight```

xbacklight is showing an error ```No outputs have backlight property```

## Fix

Fix inspired from [here](https://bbs.archlinux.org/viewtopic.php?id=178014)

First thing that has to be done is to modify the grub configuration file,
and add an argument for the kernel

The grub configuration file is located here ```/etc/default/grub```

Find the line that's saying ```GRUB_CMDLINE_LINUX_DEFAULT="quiet"``` and modify
it so it looks like this ```GRUB_CMDLINE_LINUX_DEFAULT="quiet acpi_osi=Linux"```

---------

With the next reboot, you shouldn't see an error from xbacklight anymore, in fact
if you run ```xbacklight -list``` first think showing should be **thinkpad_screen**

Although xbacklight recognizes the display now, we still can't set the brightness using it
At least on my side, didn't worked, command ran with no error but no change either.

I managed to set it using **xrandr** using this command ```xrandr --output eDP-1 --brightness .8```

***eDP-1*** is the display in my case, use ```xrandr``` to find yours

----------

Ability to set brightness from keyboard, using hotkeys, will come soon