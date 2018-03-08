## Issue

When system boots up, with each archbang installation I did, I got a message, a timeout, for which
I always had to wait 5-30 seconds to timeout basically, because it wasn't doing anything.

## Fix

Got inspired from [linuxbabe.com](https://www.linuxbabe.com/virtualbox/a-start-job-is-running-for-sys-subsystem-net-devices-eth0-device)

The idea is to disable the service that gives the timeout

- Find out with `ifconfig` the exact name of the card. In my case, it's `enp0s31f6`
- Use systemd to disable the service: `systemctl disable dhcpcd@enp0s31f6.service`
