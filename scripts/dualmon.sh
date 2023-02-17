#!/bin/bash

xrandr --output eDP1 --right-of DP1 --panning 3840x2160+3840+0 
# xrandr --output eDP1 --off
xrandr --output DP1 --primary --auto --panning 3840x2160 --scale 1.5x1.5
