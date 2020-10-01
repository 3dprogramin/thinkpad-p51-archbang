## About

In this repo, you'll find issues & fixes I've encountered in my 
experience, with the [Lenovo ThinkPad P51](https://www3.lenovo.com/us/en/laptops/thinkpad/thinkpad-p/P51/p/22TP2WPWP51) and [ArchBang](https://sourceforge.net/projects/archbang/) linux.


## System Info

**Hardware**

- Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
- 32 GB DDR4
- 1.75 TB SSD (256GB, 500GB & 1TB)
- NVIDIA Quadro M1200M 4GB GDDR5
- Integrated Intel Graphics Card
- 15.6" FHD (1920x1080), anti-glare, IPS display
- Intel Dual Band Wireless AC(2x2) 8265, Bluetooth Version 4.1
- Fingeprint reader
- 720 HD Camera
- Thunderbolt

**Software**

- ArchBang OS
- Linux kernel 5.4.67-1-lts
- openbox 3.6.1-7
- systemd 246.6-1

For more info about the system check the **systeminfo** folder


## Issues

**Power management**
- ~~set performance/battery saving~~
- ~~set battery threshold~~
- docking station (including HDMI issue)

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

**Audio**

- ~~sound either not working correctly or noizzy~~
- ~~audio device usage 100% at all times~~

**Display**

- ~~set brightness of display~~
- ~~multihead through HDMI~~


**GPU**
- ~~NVIDIA video card not working, currently running only integrated Intel card~~
- ~~NVIDIA card works now, but intel doesn't, getting bumblebee working is the next step~~
- ~~* NVIDIA card (optirun/primusrun) not working after getting out of RAM suspend~~
- ~~hashcat not recognizing card, opencl package missing~~

- because now NVIDIA card gets enabled in suspend mode, looks like battery gets drained. Needs further investigation

**Misc**
- ~~HTTP(s) requests are loading very slow, after disconnecting from VPN (PPTP)~~
- ~~Firefox not saving "Remember me" passwords~~ - solved with reinstall of OS
- ~~HP printer not working~~
- ~~fingerprint scanner not working - although there is a prototype available [here](https://github.com/nmikhailov/Validity90/tree/master/prototype) which looks promising~~
- ~~disable auto-login~~
- ~~login with fingerprint~~
- ~~CTRL+ALT+Left moves desktops in loop (3,2,1,4,3,2,1,4...) instead of stopping at desktop 1 (3,2,1, stop)~~
- teamviewer13 not starting

Check the **issues+fixes** folder for more details


## License
MIT
