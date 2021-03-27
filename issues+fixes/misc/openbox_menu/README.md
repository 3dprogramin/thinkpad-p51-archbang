## Issue

Menu error when right clicking on desktop and selecting *Applications*
The following error shows up:

`Invalid output from pipe-menu "xdg_menu --format openbox3-pipe --root-menu /etc/xdg/menus/lxde-applications.menu"`

![error](https://i.imgur.com/gtc7r6X.png)

## Solution

The command that's complaining about is found in the following file `~/.config/openbox/menu.xml`

To solve it, remove `-root-menu` the parameter from it.

The new command should look like this:

`xdg_menu --format openbox3-pipe /etc/xdg/menus/lxde-applications.menu`

---

Logout and log back in, for the changes to take effect