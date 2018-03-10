## Issue

PrtSc / Print key on keyboard does not take screenshot

## Fix

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

### Method 2 (better)

The method above is simple and does the job: copies screenshot into clipboard. I use this very often and it's very useful.

In some cases though I need to add some lines over the image, some with red some with green, capture only part of the screen, etc

There's an awesome tool that does the job perfectly. It's called [flameshot](https://github.com/lupoDharkael/flameshot)

Install it first: `sudo pacman -S flameshot`

To use it with the print button, just change the obkey command of the button to `flameshot gui`
