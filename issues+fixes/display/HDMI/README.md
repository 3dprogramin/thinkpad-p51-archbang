**IMPORTANT**

Follow this once you have bumblebee running correctly

---

Making HDMI work is a combination of few things:

- X11 xorg.conf file (*file in repo*)
- X11 intel conf file (*file in repo*)
- bumblebee X11 nvidia config file (*file in repo*)
- running `intel-virtual-output`
- `xrandr --auto`

The list above is the solution in short.

The config files are the first step, and I found more about this in [here](https://unix.stackexchange.com/questions/321151/do-not-manage-to-activate-hdmi-on-a-laptop-that-has-optimus-bumblebee), which was of great help.

**Correct path** for config file is first line inside file (commented out)

Running `intel-virtual-output` is required to make the displays show up, spent some time on figuring this out :smile:

The last step, is to configure your output with `xrandr`. Doing it `xrandr --auto` do automatic configuration, which should make the monitor (TV) screen show something.

After this point, it's only a matter of configuring how you want the screens to look.

For e.g

```
xrandr --auto --output VIRTUAL2 --mode VIRTUAL2.543-1920x1080 --rate 60 --right-of eDP1
```

Will make HDMI connected monitor show as right of laptop's screen, a *continuous* screen.