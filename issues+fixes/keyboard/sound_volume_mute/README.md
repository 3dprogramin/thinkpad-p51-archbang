## Issue

Sound volume increase, decrease and mute buttons are not working

## Fix

An easy fix for this one, similar to the mic button solution

Create keyboard shortcuts using obkey in this fashion:

- raise volume - `amixer set Master 2%+ unmute`
- lower volume - `amixer set Master 2%- unmute`
- mute volume - `amixer set Master toggle`

The percentages can be changed according to your taste, for me 2% was best
