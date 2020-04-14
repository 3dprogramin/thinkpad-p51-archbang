## Issue

`pulseaudio` package is required by certain apps for audio to work, like `discord`

Problem is, when package is installed `pulseaudio` without the package `pulseaudio-alsa`, things don't work correctly. Discord works, but other apps don't. The `pulseaudio-alsa` should be a dependency (if you ask me), but it's not

## Solution

`sudo pacman -S pulseaudio-alsa`