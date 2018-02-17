## Issue
-----------------
Mute mic button doesn't do anything

## Fix
-----------------
**alsamixer** allows us to toggle the mic 

**obkey** will help us make a custom hotkey for our button

First, make sure you can toggle the mic by running this command in terminal:
```bash
amixer sset Mic toggle
```
To verify if it works, run ***alsa*** in terminal and above Mic you should see it change from MM to 00

-------------------

Once the above works, you can install obkey to create the hotkey for the keyboard mic button
```code
yaourt obkey
```
obkey has a nice GUI interface, which allows you to set actions for certain key combinations, including ***execution*** of commands, which is what you need

should be pretty straight forward from here on
