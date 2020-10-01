## Issue

CTRL+ALT+Left key combination is moving to desktops in a loop.

Instead of going 3,2,1, stop
It's doing it this way 3,2,1,4,3,2,1,4... loops through all desktops

## Solution

The key combination handling on Arch is done by Openbox.

To solve it, you can either the `~/.config/openbox/rc.xml` and set  `<wrap>no</wrap>` for that action.
It can also be done through GUI by using obkey, locate the action and uncheck the wrap checkbox for it.