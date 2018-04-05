## About

In this repo, you'll find issues & fixes I've encountered in my 
experience, with the [Lenovo ThinkPad P51](https://www3.lenovo.com/us/en/laptops/thinkpad/thinkpad-p/P51/p/22TP2WPWP51) and [ArchBang](https://sourceforge.net/projects/archbang/) linux.


## System Info

**Hardware**

- Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
- 32 GB DDR4
- 1.25 TB SSD (1 TB & 256 GB)
- NVIDIA Quadro M1200M 4GB GDDR5
- Integrated Intel Graphics Card
- 15.6" FHD (1920x1080), anti-glare, IPS display
- Intel Dual Band Wireless AC(2x2) 8265, Bluetooth Version 4.1
- Fingeprint reader
- 720 HD Camera
- Thunderbolt

**Software**

- ArchBang OS
- Linux kernel 4.14.31-1
- openbox 3.6.1-3
- systemd 238.51-1

For more info about the system check the **systeminfo** folder


## Issues

**Power management**
- ~~set performance/battery saving~~
- ~~set battery threshold~~

**Keyboard**
- ~~touchpad tapping & natural scroll not working~~
- ~~select (home, end) with numpad not working~~
- ~~mute mic button not working~~
- ~~sound volume increase/decrease and mute buttons not working~~
- ~~print button not taking screenshot~~
- ~~set backlight of keyboard programmatically~~

**OS**
- ~~notifications not showing up in window manager~~
- ~~'A start job is running for enp0s31f6...' - at boot time~~
- ~~'mount(2) system call failed: Structure needs cleaning.' after OS reinstall on multimedia partition~~

**Display**
- ~~set brightness of display~~

- HDMI auto-switch on connect (udev), keyboard shortcuts working would also be nice

**GPU**
- ~~NVIDIA video card not working, currently running only integrated Intel card~~
- ~~NVIDIA card works now, but intel doesn't, getting bumblebee working is the next step~~
- ~~* NVIDIA card (optirun/primusrun) not working after getting out of RAM suspend~~
- ~~hashcat not recognizing card, opencl package missing~~

- because now NVIDIA card gets enabled in suspend mode, looks like battery gets drained. Needs further investigation

**Misc**
- ~~HTTP(s) requests are loading very slow, after disconnecting from VPN (PPTP)~~
- ~~Firefox not saving "Remember me" passwords~~ - solved with reinstall of OS
- teamviewer13 not starting

- fingerprint scanner not working - although there is a prototype available [here](https://github.com/nmikhailov/Validity90/tree/master/prototype) which looks promising

Check the **issues+fixes** folder for more details


## License
MIT
