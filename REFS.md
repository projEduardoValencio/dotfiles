# REFs and commands for utils

## Dual monitor
- Find providers and external monitor on ~xrandr -q~
- Exec this command ~xrandr --output SECOND_MONITOR --mode RESOLUTION --rate FRAME_RATE --left-of MAIN_MONITOR~

## Normalize Mouse
- Find mouse ID by ~xinput~
- Find libinput Accel Profile Enabled on ~xinput list-props ID~
- Set up prop ~xinput set-prop ID 'libinput Accel Profile Enabled' 0, 1~
