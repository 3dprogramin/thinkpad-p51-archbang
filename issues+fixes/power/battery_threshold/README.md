## Issue

On windows, there's an application from Lenovo called Lenovo Vantage 
from which you can set specific settings, including a start & stop 
threashold for charging the battery

## Fix

Fortunately for us, using **tlp**,  **acpi_call-lts** and **tpacpi-bat** 
we'll be able to achieve the same thing

Install the packages
```
sudo pacman -S tlp acpi_call-lts tpacpi-bat tp_smapi smartmontools acpi_call tp_smapi-lts
```

To test if everything was installed right, and if the battery is 
recognized, run:
```
sudo tlp stat -b

```
This should give you an output similar to this:


```
--- TLP 1.1 --------------------------------------------

+++ ThinkPad Battery Features
tp-smapi   = inactive (unsupported hardware)
tpacpi-bat = active

+++ ThinkPad Battery Status: BAT0 (Main / Internal)
/sys/class/power_supply/BAT0/manufacturer                   = SMP
/sys/class/power_supply/BAT0/model_name                     = 00NY493
/sys/class/power_supply/BAT0/cycle_count                    =     86
/sys/class/power_supply/BAT0/energy_full_design             =  90000 
[mWh]
/sys/class/power_supply/BAT0/energy_full                    =  92500 
[mWh]
/sys/class/power_supply/BAT0/energy_now                     =  49750 
[mWh]
/sys/class/power_supply/BAT0/power_now                      =  15730 
[mW]
/sys/class/power_supply/BAT0/status                         = 
Discharging

tpacpi-bat.BAT0.startThreshold                              =     55 [%]
tpacpi-bat.BAT0.stopThreshold                               =     95 [%]
tpacpi-bat.BAT0.forceDischarge                              =      0

Charge                                                      =   53.8 [%]
Capacity                                                    =  102.8 [%]
```

------
We have the ability to set two types of thresholds. A **start** and a 
**stop** threshold. 

Once they're set, when AC is plugged into laptop, tlp will check if the 
current value of the battery is lower then the start threshold. If it 
is, it will start charing the battery, up until it hits the stop 
threshold. 

If you plug AC in, and battery value is over start threshold, it won't 
charge it, thus, extending the battery's life.

A very useful feature, if you ask me.

Open a new terminal and type:
```
watch -n1 'sudo tlp stat -b'
```
This will show you the battery stats, updated every second, kind of 
*real-time*

In order to set the start threshold, run:
```
/usr/bin/tpacpi-bat -s ST 0 55
```
The above will set the start threshold to 55%

To set the stop threshold use:

```
/usr/bin/tpacpi-bat -s SP 0 95
```

This will set the stop threshold to 95%

------
The best way to set and unset the threshold, before OS shuts down, is to 
use a service.

Create a service file called:
```
sudo touch /etc/systemd/system/battery-threshold.service
```

The file (and it's content) can be found in the repo.

Once the file is set, last thing to do is to enable the service:

```
systemctl enable battery-threshold.service
```


