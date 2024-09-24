## Issue

Not really an issue, but would be nice to have some sounds playing when connecting / disconnecting a USB device.

## Solution

- Make sure you have two audio files, one for connect one for disconnect
- Create an udev rule

Create a udev rule file:`sudo nano /etc/udev/rules.d/90-usb-sound.rules`

```bash
ACTION=="add", SUBSYSTEM=="usb", RUN+="/usr/bin/aplay /home/icebox/Documents/scripts/usb-connect-disconnect/audio/connect.wav"
ACTION=="remove", SUBSYSTEM=="usb", RUN+="/usr/bin/aplay /home/icebox/Documents/scripts/usb-connect-disconnect/audio/disconnect.wav"
```

Modify the audio file paths accordingly, which is the argument passed to aplay