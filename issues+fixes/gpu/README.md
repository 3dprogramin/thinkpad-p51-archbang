Issue
---
Getting the NVIDIA graphics card working on linux is usually a \`hard\` job to do. In the past, I managed to get my card from previous laptop working on kali linux, but after following a LONG tutorial.

This time, decided to start from the bottom, and go one step at the time.

Will be starting with the arch docs on NVIDIA.

Fix
-----

#### It's important to read the documentation from arch website first.
### Most importantly, you should read this [NVIDIA](https://wiki.archlinux.org/index.php/NVIDIA), [NVIDIA Optimus](https://wiki.archlinux.org/index.php/NVIDIA_Optimus) 
The links above are very important, because depending on your card, you might need different drivers, although for ThinkPad P51, this should work without any problems.

---------------------



- `sudo pacman -S nvidia-lts lib32-nvidia-utils nvidia-settings`
- reboot

- `sudo nvidia-xconfig` - this creats a  Xorg config file, /etc/X11/Xorg.conf

- NVIDIA driver in use at this point `lspci -v`, but problem is some fonts are way too big, this is because of edid dpi option

-  `sudo nvidia-xconfig --no-use-edid-dpi` - regenerate the Xorg config, without edid

- Now, our fonts are a bit too small ... to fix it, I've installed some xorg fonts pacakges

```
xorg-font-util 1.3.1-1
xorg-font-utils 7.6-4
xorg-fonts-100dpi 1.0.3-3
xorg-fonts-75dpi 1.0.3-3
xorg-fonts-alias 1.0.3-1
xorg-fonts-encodings 1.0.4-4
xorg-fonts-type1 7.7-2
```
I've installed this because there were errors about most of them in `/var/log/Xorg.0.log`



- last step would be to edit the `/etc/X11/xorg.conf` and add **"DPI" "100x100"** option

```
Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    Option         "DPI" "100x100"
    Option         "UseEdidDpi" "False"
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection
```
- reboot

### NVIDIA card works !

#### Tested with blender, speed almost double than CPU !

#### Next step would be to get bumblebee running.

There is one downside (yet) though. NVIDIA card is used by display as well. We would need the integrated card to take care of display and NVIDIA only for rendering.

In this way, we can save power in a more efficient way.

This should be achievable with bumblebee. Will get to it soon
