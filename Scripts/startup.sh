#!/bin/bash

# set dual monitor
xrandr --output HDMI-1-0 --mode 1920x1080 --rate 120 --above eDP-1

# set mouse speed
xinput set-prop 9 365 0, 1
xinput set-prop 9 362 -0.2
