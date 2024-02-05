#!/bin/bash

PATH_VIDEO=~/Videos/Hidamari/astronaut-colorful-moewalls-com.mp4

# Define o wallpaper no monitor primario
xwinwrap -g 1920x1080 -ni -s -nf -b -un -ov -fdt -argb -- mpv --mute=yes --no-audio --no-osc --no-osd-bar --quiet -wid WID --loop $PATH_VIDEO &

# Define o wallpaper no monitor secundario
xwinwrap -g 1920x1080+0+1080 -ni -s -nf -b -un -ov -fdt -argb -- mpv --mute=yes --no-audio --no-osc --no-osd-bar --quiet -wid WID --loop $PATH_VIDEO &

