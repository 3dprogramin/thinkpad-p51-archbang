Issue
----

Teamviewer not starting up correctly.

Fix
----

Install `sddm` (simple desktop display manager) and enable it

`sudo pacman -S sddm`

`sudo systemctl enable sddm`

This will make the OS login part look different.
In order to enable fingerprint login, edit `/etc/pam.d/sddm` and add the following line at top:

`auth      sufficient pam_fprintd.so`

