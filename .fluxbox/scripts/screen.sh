#!/bin/bash
# script to display in the other screen

# check to see if its connected the cable
if [ ! -z "$(xrandr -q|grep LVDS1)" ]; then
    # if currently not displaying display
    #if [ -z "$(xrandr -q|grep '477mm x 268mm')" ]; then
    xrandr --output VGA1 --mode 1280x800 --right-of LVDS1
    #else
    #    xrandr --output VGA1 --off
    #fi
fi
