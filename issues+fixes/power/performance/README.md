## Issue

No option by default to manage power.

On windows, you can set certain power plans, for example, when on 
battery, to use CPU best speed, or when on battery, to save power 
instead of performing at maximum

## Fix

We can achieve the same thing on linux

For this, I've used **tlp** which is is a Linux advanced power manager.

First of all, make sure it's installed if not, install:
```
sudo pacman -S tlp
```

To see all the statistics, run:
```
sudo tlp stat
```

What we're most interested in is what's at the top, the configured 
settings, which can be found in ***/etc/default/tlp***

This file contains the settings tlp is using in order to manage the 
power

For more details about tlp check the 
[docs](http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html)

--------------

There are 2 sets of options you can set, same options but one set is for 
running on **AC** and one set for running on **battery**, similar to 
windows.

Here are few examples I'm using:
```
CPU_SCALING_GOVERNOR_ON_AC=performance
CPU_SCALING_GOVERNOR_ON_BAT=powersave
```
You guessed it, when it's on AC it will perform at best speed and when 
on battery, will save power.

```
CPU_MIN_PERF_ON_AC=0
CPU_MAX_PERF_ON_AC=100
CPU_MIN_PERF_ON_BAT=0
CPU_MAX_PERF_ON_BAT=60
```
The above settings are in percent.

When it's on AC it will use 0-100% CPU processing power. When on 
battery, will use 0-60%

-----
The **/etc/default/tlp** file I'm using can be found in the repo

