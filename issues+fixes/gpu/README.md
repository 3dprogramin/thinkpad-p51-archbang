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

<img src="https://image.ibb.co/cB0CTS/intel.png" title="glxspheres64">

`optirun glxspheres64`

<img src="https://image.ibb.co/jWbfF7/nvidia.png" title="optirun glxspheres64">
</p>


From the screenshots, it can be seen that the NVIDIA card performs
**almost 10 times better**, when it comes to rendering !
