## Issue

Got this error `mount(2) system call failed: Structure needs cleaning.` when trying to mount a partition, ext4

in which I'm having multimedia files

## Solution

Found it [here](https://askubuntu.com/questions/910078/structure-needs-cleaning-error-cannot-mount-partition) and here's the one line command:
`sudo fsck.ext4 /dev/sdaX`

I had to press `Y` few times, there were some bad nodes / inodes, and looks like it solved it
