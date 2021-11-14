Issue
---
Sound not working through dock station or if it is working, it's noisy

Fix
-----

Install pavucontrol `sudo pacman -S pavucontrol`

Then play with the configuration for a while to see what works for you.
*Change volume from command line: `pactl set-sink-volume @DEFAULT_SINK@ 100%`*

What worked for me is the following setup:

![playback](https://i.imgur.com/7VlzFXe.png)

![output](https://i.imgur.com/aUf8IQn.png)

![input devices](https://i.imgur.com/OCQAxWV.png)

![configuration](https://i.imgur.com/OCQAxWV.png)
