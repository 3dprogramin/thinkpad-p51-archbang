## Issue

Notifications not showing up, and this is what I've found in ***journalctl***

```
Feb 17 15:25:27 p51 org.freedesktop.Notifications[1253]: Unable to init server: Could not connect: Connection refused
Feb 17 15:25:27 p51 notify-osd[1751]: cannot open display: 
```

## Fix

Found the solution on [bbs.archlinux.org](https://bbs.archlinux.org/viewtopic.php?id=224787)

I personally, have added the line to 
```
~/.config/openbox/autostart
```

In short, to fix it, just run:
```
echo "(sleep 2 && dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY) &" >> ~/.config/openbox/autostart
```

Update
---

I had to reinstall the OS, and the above wasn't enough

Installing `notify-osd` package solved it
