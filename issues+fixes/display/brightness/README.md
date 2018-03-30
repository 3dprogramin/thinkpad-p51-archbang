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

After NVIDIA driver installation
----------

Once I got the GPU going, `xbacklight` started to work.

This method is much better. The previous one, using xrandr, is indeed setting the brightness, but when you set
it over 1, the white is much too bright. The max you could go, and still see something, would be 1.3

With `xbacklight -inc 10` or `xbacklight -dec 10` you can increase or decrease the brightness
very easily.

I've created keyboard shortcuts, for the `FN+F5` and `FN+F6` key combinations, because that's how
it would work on windows, and works very good.

After OS restart
---

I had to reinstall my linux OS, and I was expecting it to work after the NVIDIA driver installation, well ... it didn't

The error I was getting, was the one I got from the beginning, which is `No outputs have backlight property`

The good news is that, compared to before, I had the backlight folder `/sys/class/backlight/intel_backlight` in other words the OS was
recognizing the backlight, but xbacklight wasn't

[Here](https://wiki.archlinux.org/index.php/backlight#xbacklight) is the solution for xbacklight

The idea is append to `/etc/X11/xorg.conf` the following:
```
Section "Device"
    Identifier  "Card0"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
```

**OBS:** If `/etc/X11/xorg.conf` doesn't exist, create it and add the content from above, it won't mess the GPU drivers

