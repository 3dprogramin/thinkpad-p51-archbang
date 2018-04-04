## Issue

Touchpad buttons work, but tapping (apply pressure to it's surface) does 
not.

## Fix

Using **xorg-xinput** we'll be able to set some settings for the 
touchpad, which are not available in the default archbang settings.

First, install xorg-input
```
sudo pacman -S xorg-xinput
```

#### Get the ID of the touchpad
Run the command:
```
xinput list
```
Which will return you something like this
```
⎡ Virtual core pointer                    	id=2	[master pointer  
(3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  
(2)]
⎜   ↳ Compx 2.4G Receiver                     	id=10	[slave  pointer  
(2)]
⎜   ↳ Compx 2.4G Receiver                     	id=11	[slave  pointer  
(2)]
⎜   ↳ HID 6901:2701                           	id=13	[slave  pointer  
(2)]
⎜   ↳ SynPS/2 Synaptics TouchPad              	id=16	[slave  pointer  
(2)]
⎜   ↳ TPPS/2 IBM TrackPoint                   	id=17	[slave  pointer  
(2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard 
(2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard 
(3)]
    ↳ Power Button                            	id=6	[slave  keyboard 
(3)]
    ↳ Video Bus                               	id=7	[slave  keyboard 
(3)]
    ↳ Sleep Button                            	id=8	[slave  keyboard 
(3)]
    ↳ Compx 2.4G Receiver                     	id=9	[slave  keyboard 
(3)]
    ↳ HID 6901:2701                           	id=12	[slave  keyboard 
(3)]
    ↳ Integrated Camera: Integrated C         	id=14	[slave  keyboard 
(3)]
    ↳ AT Translated Set 2 keyboard            	id=15	[slave  keyboard 
(3)]
    ↳ ThinkPad Extra Buttons                  	id=18	[slave  keyboard 
(3)]

```
In my case, the ID we're looking for is 16, from it's name ***SynPS/2 
Synaptics TouchPad***

#### Get the properties of the device, using it's ID
xinput has lots of options, and one of it is ***list-props***. Using 
this option, and giving an ID of a device, it will show us
all the properties that device has.

In my case
```
xinput list-props 16
```
which will return something like this
```
Device 'SynPS/2 Synaptics TouchPad':
	Device Enabled (143):	1
	Coordinate Transformation Matrix (145):	1.000000, 0.000000, 
0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
	libinput Tapping Enabled (322):	1
	libinput Tapping Enabled Default (323):	0
	libinput Tapping Drag Enabled (324):	1
	libinput Tapping Drag Enabled Default (325):	1
	libinput Tapping Drag Lock Enabled (326):	0
	libinput Tapping Drag Lock Enabled Default (327):	0
	libinput Tapping Button Mapping Enabled (328):	1, 0
	libinput Tapping Button Mapping Default (329):	1, 0
	libinput Natural Scrolling Enabled (277):	1
	libinput Natural Scrolling Enabled Default (278):	0
	libinput Left Handed Enabled (279):	0
	libinput Left Handed Enabled Default (280):	0
	libinput Accel Speed (281):	0.500000
	libinput Accel Speed Default (282):	0.000000
	libinput Scroll Methods Available (286):	1, 1, 0
	libinput Scroll Method Enabled (287):	1, 0, 0
	libinput Scroll Method Enabled Default (288):	1, 0, 0
	libinput Send Events Modes Available (293):	1, 1
	libinput Send Events Mode Enabled (294):	0, 0
	libinput Send Events Mode Enabled Default (295):	0, 0
	libinput Disable While Typing Enabled (330):	1
	libinput Disable While Typing Enabled Default (331):	1
	Device Node (265):	"/dev/input/event9"
	Device Product ID (264):	2, 7
	libinput Drag Lock Buttons (296):	<no items>
	libinput Horizontal Scroll Enabled (297):	1
```

This are the options that are available from libinput.

The options can be changed like this
```
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 
1
```
or like this
```
xinput set-prop 16 322 1
```
This will enable tapping for the touchpad.

I personally have enabled the natural scrolling as well, and increased 
the acceleration speed to .5

#### To keep in mind...
You might have noticed that 323 is the **libinput Tapping Enabled 
Default** option, which ... in theory, should allow us to set the 
default value for that specific property, in reality, doesn't really do 
it.

This is the error I'm getting:
```
X Error of failed request:  BadAccess (attempt to access private 
resource denied)
  Major opcode of failed request:  131 (XInputExtension)
  Minor opcode of failed request:  57 ()
  Serial number of failed request:  19
  Current serial number in output stream:  20
```
Same thing with sudo

#### Solution to "keep in mind"
Although the default value can't be set, we can still set the needed 
properties at startup, each time.

The init-touchpad.sh contains the options I've set myself, and I'm 
running it as a service at startup. ***~/.config/openbox/autostart*** 
will do the job as well.


Palm detection
-----
After I've reinstalled my OS, I saw different options comming from xinput, in regards to the touchpad. Only after a while, when I realized the palm detection wasn't working, figured out why. With the OS reinstall, I've installed the synaptics driver as well, so libinput wasn't being used but the synaptics driver. After removing the synaptics package `sudo pacman -R xf86-input-synaptics` palm detection was back on.