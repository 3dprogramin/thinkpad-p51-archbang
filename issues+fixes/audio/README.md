## Issue

`pulseaudio` package is required by certain apps for audio to work, like `discord`

Problem is, when package is installed `pulseaudio` without the package `pulseaudio-alsa`, things don't work correctly. Discord works, but other apps don't. The `pulseaudio-alsa` should be a dependency (if you ask me), but it's not

## Solution

`sudo pacman -S pulseaudio-alsa`

Restart

Some apps will be heard noizzy, in audio settings of app (i.e discord) switch from `Default` to `Built in` audio device

### gtk-recordmydesktop

Audio won't work correctly here either, change things like this

![gtk screenshot audio device](https://i.imgur.com/6cE1wGe.png)
