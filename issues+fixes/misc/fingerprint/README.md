Issue
----

Fingerprint scanner not working with `fprint` (libfprint)

Fix
----

Install `fprintd` and and `libfprint-vfs0097-git`

`fprintd` is a fingerprint manager daemon, which handles the fingerprinting on demand and other stuff.

`libfprint-vfs0097-git` is a patch for `fprintd` to handle the fingerprint scanner on the ThinkPad P51, which comes with the following fingerprint reader hardware:

```Bus 001 Device 005: ID 138a:0097 Validity Sensors, Inc. ```

This is needed because only with `fprintd` the hardware on this laptop won't work, the patch is needed for it.

After the packages have been installed, you'll have to run `fprintd-enroll` to scan your fingerprint. Once that's ready, you can verify if finger gets recognized with `fprintd-verify`

The above will only get your fingerprint setup with fprintd. In order to actually use it when needed, modifications to files in `/etc/pam.d/` folder will be needed. My `/etc/pam.d/` folder contains the following:
```
[icebox@p51 pam.d]$ ls /etc/pam.d/
chage      groupadd   other     sshd          system-local-login   usermod
chfn       groupdel   passwd    su            system-login         vncserver
chgpasswd  groupmems  polkit-1  sudo          system-remote-login  xscreensaver
chpasswd   groupmod   rlogin    su-l          system-services
chsh       login      rsh       system-auth   useradd
cups       newusers   shadow    systemd-user  userdel
```

Currently, on my machine I've changed the `xscreensaver` file, to look like this:
```
#%PAM-1.0

# fingerprint scanner (fprintd)
auth      sufficient pam_fprintd.so
auth       include      system-auth

# SuSE 9.0: (along with "configure --with-passwd-helper" and "unix2_chkpwd")
# auth     required       pam_unix2.so  nullok

# Distant past:
# auth       required   /lib/security/pam_pwdb.so shadow nullok

# Account validation
#account include system-auth
```

This is the line that was added up `auth      sufficient pam_fprintd.so`

With this change, when X minutes pass by and screensaver popsup (xscreensaver), when I try to get over it, it's not asking me for password but for fingerprint.

I've tried the same with the `sudo` file, and it works in some situations. If `sudo ls` is typed, it's asking for finger, which is what I wanted. But unfortunetly, it does the same when I shutdown, or just crashes randomly from time to time, so I had to take it out from `sudo` file (for now).