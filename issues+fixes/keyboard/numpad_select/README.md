## Issue

When numpad is disabled (digits don't work, but arrows and home, end,etc) the arrows and other keys
inside numpad work fine, but when it comes to selecting text, it doesn't

## Fix

add  **Option "XkbOptions" "numpad:microsoft"** to 
```
/etc/X11/xorg.conf.d/01-keyboard-layout.conf   
```
**OBS**: Filename might be different, but  still contain "keyboard". Path should be the same


### Example

```
Section "InputClass"
        Identifier "keyboard-layout"
        Driver "evdev"
        MatchIsKeyboard "yes"
        Option "XkbLayout" "us"
        Option "XkbOptions" "numpad:microsoft"
EndSection
```
