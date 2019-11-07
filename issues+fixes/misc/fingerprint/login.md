Issue
---
Auto-login on startup
Although nice for many, not something useful for me

Fix
--

To disable auto-login, and get asked for a password edit the following file 
`/etc/systemd/system/getty@tty1.service.d/autologin.conf`

to look like this

```
[Service]
ExecStart=
# original - auto-login
#ExecStart=-/sbin/agetty --autologin YOUR_USER --noclear %I 38400 linux

# ask for password
ExecStart=-/sbin/agetty -n -o YOUR_USER %I
```

### Fingerprint login
Password is nice, but why not take advance of the laptop's fingeprint scanner ?

Make sure the file `/etc/pam.d/system-local-login` has the content

```
#%PAM-1.0

# fingerprint login
auth      sufficient pam_fprintd.so

auth      include   system-login
account   include   system-login
password  include   system-login
session   include   system-login
```