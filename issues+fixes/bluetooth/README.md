## Issue

I got a Huawei Devialet bluetooth speaker and it didn't just work out of the box, to connect it with the laptop.

The error that kind of breaks things is `Connection Failed: br-connection-canceled`

![screenshot](https://i.imgur.com/qtfL3sA.png)

## Solution

- First, make sure you checked the Arch blueetooth wiki page [https://wiki.archlinux.org/title/bluetooth](here).
  Install the bluez packages described in the wiki.
  Install `blueman` as well, for a GUI, might come handy.
- On my end, I also installed the `pulseaudio-bluetooth` package too. It might be required, it might be not required on your end.
- Use `bluetoothctl` to pair and connect to the device:

```
-scan on
-remove XX:XX:XX:XX:XX:XX, if it had already been paired
-trust XX:XX:XX:XX:XX:XX
-pair XX:XX:XX:XX:XX:XX
-connect XX:XX:XX:XX:XX:XX
```

Got this from a stackoverflow [answer](https://askubuntu.com/questions/1423297/org-bluez-error-authenticationtimeout-org-bluez-error-failed-br-connection-unkn#answer-1429906)

### Important

You might be required to do the last step each time you restart your laptop.