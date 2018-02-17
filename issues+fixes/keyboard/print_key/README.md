## Issue
-----------------
PrtSc / Print key on keyboard does not take screenshot

## Fix
-----------------
We're going to fix this using **escrotum** and **obkey**

Install them:
```
sudo pacman -S escrotum obkey
```

In order to get the screenshot, in clipboard, we run:
```
escrotum -C
```
Make sure this works

Last step would be to bind the key to the command, using obkey
