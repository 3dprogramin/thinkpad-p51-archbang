## Issue

When system boots up, with each archbang installation I did, I got a message, a timeout, for which
I always had to wait 5-30 seconds to timeout basically, because it wasn't doing anything.

## Fix

Got inspired from [linuxbabe.com](https://www.linuxbabe.com/virtualbox/a-start-job-is-running-for-sys-subsystem-net-devices-eth0-device)

The idea is to disable the service that gives the timeout

- Find out with `ifconfig` the exact name of the card. In my case, it's `enp0s31f6`
- Use systemd to disable the dhcpcd service for the card: `systemctl disable dhcpcd@enp0s31f6.service`

## Update

After a OS reinstall, found out, the above isn't enough ... this is probably the most annoying problem I had with arch

Had this problem with all the installations, and all the time

Found the real solution [here](https://bbs.archlinux.org/viewtopic.php?pid=1632295#p1632295)

-----

Create a service file with the following path: `/etc/systemd/system/systemd-user-sessions.service`

Add the following content:

```
[Unit]
Description=Permit User Sessions
Documentation=man:systemd-user-sessions.service(8)
After=remote-fs.target nss-user-lookup.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/lib/systemd/systemd-user-sessions start
ExecStop=/usr/lib/systemd/systemd-user-sessions stop
```

Restart, and should be all fine now
