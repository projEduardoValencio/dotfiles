#!/bin/bash
scrot -s ~/Pictures/screenshots/$(date +%F_%T).png -e 'xclip -selection clipboard -t image/png -i $f'
