## Issue

On windows, there's an application from Lenovo called Lenovo Vantage 
from which you can set specific settings, including a start & stop 
threashold for charging the battery

## Fix


On linux the same can be achieved using **tlp** and this variables inside the *tlp.conf* configuration file
```
START_CHARGE_THRESH_BAT0=75
STOP_CHARGE_THRESH_BAT0=85
```

Check [issues+fixes/power/performance/tlp.conf](https://github.com/3dprogramin/thinkpad-p51-archbang/blob/master/issues%2Bfixes/power/performance/tlp.conf) for an example
