## Issue

On windows, couldn't find a way to turn on/off the keyboard light programmatically/command-line

The keyboard light can be enabled/disabled by pressing ***FN+Space*** on both operating systems, and it has 3 states:
- off
- enabled (low)
- enabled (strong)

Which is fine ... but we want to do it programmatically.

When it comes to linux, very easy to do it.


## Fix

Install **tlp** and **tpacpi-bat**
```code
sudo pacman -S tlp tpacpi-bat
```

After the packages have been installed, you should see this path in the filesystem
```
/sys/class/leds/tpacpi::kbd_backlight
```

Inside it should be multiple files, including ***brightness*** and ***max_brightness***

### Usage
In order to change the brightness, you'll have to change the value inside the brightness file.

This can be easily achieved with an echo but you do have to be root

```bash
sudo su		# switch to root
echo 1 > /sys/class/leds/tpacpi::kbd_backlight/brightness	# enable (low light)
echo 2 > /sys/class/leds/tpacpi::kbd_backlight/brightness	# enable (strong light)
```

## Reboot

Luckly for us, looks like the backlight persists between reboots.
This was different on windows, it wasn't persistent.

When system is suspended to RAM, backlight does not persist.

I've tried to use systemd with suspend and resume services, but looks like the light is disabled before
the suspend scripts gets a change to get the value.
