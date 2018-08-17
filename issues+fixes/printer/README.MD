Issue
-----

HP DeskJet printer requires some setup in order to get it working

Solution
-----

- install cups `pacman -S cups`
- add your user to `lpadmin` group
- start and enable cups
- navigate to `http://localhost:631` to configure your printer
- [this](https://gist.github.com/edoz90/660a2a67b9bc8a815ba537530137636a) url is also useful


Scanning
---

For scanning, I'm using the printers web interface, looks like it's the easiest way to do it
