#!/bin/sh

notify-send -a i3 -u low -t 5000 "Preparing to shutdown in 5 seconds"
i3-msg exit
sudo poweroff
