Issue
-----

Xerox WorkCentre 3025 printer & scanner setup

Solution
-----

- install cups `pacman -S cups`
- add your (OS) user to `lpadmin` group
- start the cups service: `systemctl start cups`
- [Download and install](https://www.support.xerox.com/en-us/product/workcentre-3025/content/129628) the official Linux drivers for Xerox WorkCentre 3025 
  - run `install.sh`

- navigate to `http://localhost:631` to add and configure the printer.
  - the correct printer will show up only after the (official) drivers above are installed

- install the sane package for scanning functionality
  - `pacman -S extra/sane`


## Print

If the steps above were done with success, the printer should now show up when `CTRL+P` is pressed, pretty much everywhere.

Scan
---

In order to scan use the following `scanimage -o scanned_doc.png`
