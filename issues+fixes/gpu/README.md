Issue
---
Getting the NVIDIA graphics card working on linux is usually a \`hard\` task to achieve. In the past, I managed to get my NVIDIA card (from previous laptop) working on kali linux, but after lots of testing and following a LONG tutorial.

This time, decided to start from the bottom, and go one step at the time.

The arch documentation is one of the best you can find on-line, so that's how I'll start.

Fix
-----

#### It's important to read the documentation from arch website first.
### Most importantly, you should read this [NVIDIA](https://wiki.archlinux.org/index.php/NVIDIA), [NVIDIA Optimus](https://wiki.archlinux.org/index.php/NVIDIA_Optimus), [Bumblebee](https://wiki.archlinux.org/index.php/Bumblebee)
The links above are very important, because depending on your card, you might need different drivers, although for ThinkPad P51, what you'll read below should work without problems.

---------------------



- Install the driver: `sudo pacman -S nvidia-lts lib32-nvidia-utils nvidia-settings`

- Add a [pacman hook](https://wiki.archlinux.org/index.php/NVIDIA#Pacman_hook) in order for the initframs to update when the driver updates

- reboot

- `sudo nvidia-xconfig` - this creates a  Xorg config file, /etc/X11/Xorg.conf

- add 2 lines to the bottom of the `~/.xinitrc` file like [NVIDIA_Optimus#Using_nvidia](https://wiki.archlinux.org/index.php/NVIDIA_Optimus#Using_nvidia)

- reboot

- NVIDIA driver should be in use at this point, `lspci -v` to confirm, but problem is some fonts are way too big, this is because of edid dpi option

- Booting was possible only with Hybrid graphics card option set in BIOS at this point. Discrete wasn't booting (possibly even after step 2)

- `sudo nvidia-xconfig --no-use-edid-dpi` - regenerate the Xorg config, without edid

- Now, our fonts are a bit too small ... to fix it, I've installed some xorg fonts packages

```
xorg-font-util 1.3.1-1
xorg-font-utils 7.6-4
xorg-fonts-100dpi 1.0.3-3
xorg-fonts-75dpi 1.0.3-3
xorg-fonts-alias 1.0.3-1
xorg-fonts-encodings 1.0.4-4
xorg-fonts-type1 7.7-2
```
I installed those because there were errors about most of them in `/var/log/Xorg.0.log`



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


#### Tested with blender, speed is more then double compared to CPU !

--------------------

## Switch between cards

We've achieved our goal, at least half of it. The point was to get NVIDIA card working, but we do want to have the Intel card do most of the work, such as showing screen/display, playing videos, etc.

Currently, our NVIDIA card does all the work. 

To have the ability to switch between cards, we're going to use [bumblebee](https://wiki.archlinux.org/index.php/Bumblebee)

- Install bumblebee `sudo pacman -S bumblebee` and other needed packages - more info: [Bumblebee#Installation](https://wiki.archlinux.org/index.php/bumblebee#Installation)

- Add your user to bumblebee group: `sudo gpasswd -a your_user bumblebee`

- Enable service: `systemctl enable bumblebeed.service`

- reboot

- make sure Hybrid graphics is enabled in BIOS

Now, we should have our Intel card being our primary graphics card, and NVIDIA card can be used when needed with `optirun`

### Screenshots using `glxspheres64`

<p float="left">

`glxspheres64`

<img width="50%" height="50%" src="https://image.ibb.co/cB0CTS/intel.png" title="glxspheres64">

`optirun glxspheres64`

<img width="50%" height="50%" src="https://image.ibb.co/jWbfF7/nvidia.png" title="optirun glxspheres64">
</p>


From the screenshots, it can be seen that the NVIDIA card performs
**almost 10 times better**, when it comes to rendering !

primusrun
-----

After reading more into the bumblebee docs, I stumbled upon 
[primusrun](https://wiki.archlinux.org/index.php/Bumblebee#Primusrun). 
It's a drop-in replacement for `optirun`, and runs much better.

Install the `primus ` package

With the default settings, running `primus glxshperes64` is giving me very low results. That's because primus should be ran without any window managers running, and I am running openbox. 

[Solution](https://wiki.archlinux.org/index.php/Bumblebee#Primusrun_mouse_delay_.28disable_VSYNC.29) is very easy though, run the command like this: `vblank_mode=0 primusrun glxspheres64`

In this way, the results should be the following:

<p float="left">

`primusrun glxspheres64`

<img width="50%" height="50%" src="https://image.ibb.co/fTjOk7/primusrun.png" title="primusrun glxspheres64">
</p>

### This gives us at least another 100+ frames/second !

> log from glxspheres64
```
636.772197 frames/sec - 710.637771 Mpixels/sec
645.447755 frames/sec - 720.319695 Mpixels/sec
728.442861 frames/sec - 812.942233 Mpixels/sec
728.563571 frames/sec - 813.076945 Mpixels/sec
728.559144 frames/sec - 813.072005 Mpixels/sec
730.932558 frames/sec - 815.720735 Mpixels/sec
729.546110 frames/sec - 814.173459 Mpixels/sec
730.789787 frames/sec - 815.561402 Mpixels/sec
730.841349 frames/sec - 815.618945 Mpixels/sec
889.795599 frames/sec - 993.011889 Mpixels/sec
1115.304955 frames/sec - 1244.680330 Mpixels/sec
1126.529438 frames/sec - 1257.206853 Mpixels/sec
1119.462634 frames/sec - 1249.320299 Mpixels/sec
1107.358884 frames/sec - 1235.812515 Mpixels/sec
1111.568020 frames/sec - 1240.509910 Mpixels/sec
687.559364 frames/sec - 767.316251 Mpixels/sec
727.304922 frames/sec - 811.672293 Mpixels/sec
732.618870 frames/sec - 817.602659 Mpixels/sec
727.277619 frames/sec - 811.641823 Mpixels/sec
729.054152 frames/sec - 813.624433 Mpixels/sec
730.833603 frames/sec - 815.610301 Mpixels/sec
730.784901 frames/sec - 815.555950 Mpixels/sec
726.220850 frames/sec - 810.462468 Mpixels/sec
733.658381 frames/sec - 818.762753 Mpixels/sec
726.581908 frames/sec - 810.865409 Mpixels/sec
727.875052 frames/sec - 812.308558 Mpixels/sec
729.220413 frames/sec - 813.809981 Mpixels/sec
728.455625 frames/sec - 812.956478 Mpixels/sec
729.690417 frames/sec - 814.334506 Mpixels/sec
...
```

Power management
----------

In terms of power, now both cards are **up**, although the NVIDIA card is used only when we need to render, it runs all the time, even when we don't render. Most of the time it's < 1% but we would like to shut it down completly when we don't use it, so we save some battery power.

With the help of [bbswitch](https://wiki.archlinux.org/index.php/Bumblebee#Power_management) it's very easy to turn the card on/off.

### Install

- Install the package `bbswitch` or `bbswitch-dkms` (for lts kernel)
- Create a file (if it doesn't exist already) named `/etc/modprobe.d/bbswitch.conf` with the following content: `options bbswitch load_state=0 unload_state=1`
- reboot
- That's it !

Now, the card should be disabled from boot. When we run `primusrun` or `optirun` card will start and we can use it as before. 
When the primusrun process finishes, the card gets shutdown.
This is great, because it saves up battery power !


Issue 2
-----

The problem I've got now is that when laptop gets out of RAM suspend, I'm getting the following errors:

```
Mar 07 19:30:42 p51 kernel: nvidia-nvlink: Nvlink Core is being initialized, major device number 237
Mar 07 19:30:42 p51 kernel: NVRM: The NVIDIA GPU 0000:01:00.0
                            NVRM: (PCI ID: 10de:13b6) installed in this system has
                            NVRM: fallen off the bus and is not responding to commands.
Mar 07 19:30:42 p51 kernel: nvidia: probe of 0000:01:00.0 failed with error -1
Mar 07 19:30:42 p51 kernel: NVRM: The NVIDIA probe routine failed for 1 device(s).
Mar 07 19:30:42 p51 kernel: NVRM: None of the NVIDIA graphics adapters were initialized!
Mar 07 19:30:42 p51 kernel: nvidia-nvlink: Unregistered the Nvlink Core, major device number 237
```

~~The problem seems to occur only when optirun or primus was started (card was loaded). 
If card is not loaded, errors won't show after suspend.~~

After more testing, problem occurs even when card is not loaded, and laptop gets suspended. Errors can be checked with `journalctl -f`. In my case, randomly, errors were showing after suspending, around 1/5 cases when card wasn't loaded. If card was loaded, 5/5. When it happens though, it's kind of bad. Errors above are not showing only once, but few times every second, which is def not good.


## Fix

Tried all type of things to get this one going ... playing with bbswitch and bumblebee's config, running a service on suspend, etc and not seem to work, until I read [this](https://forums.gentoo.org/viewtopic-p-8129614.html?sid=f84d3c11ffe41e66c3905cb5ca3cf5b5)

In short, the solution is this:

- add `pcie_port_pm=off` to `/etc/default/grub` so it looks like this: `GRUB_CMDLINE_LINUX_DEFAULT="quiet acpi_osi=Linux pcie_port_pm=off"`

- regenerate grub config file with: `grub-mkconfig -o /boot/grub/grub.cfg`

- reboot

This solves the issue, in terms of not getting the errors anymore, and also having the card working after suspend, which wasn't working before.

One problem still remains. That's when the card is used, and you suspend it. On my end, screen just stays blank. 

This is not a problem for me though, since I don't use the card that often, and when I do, I can just close the app/primusrun, and start it after suspend, which will work.