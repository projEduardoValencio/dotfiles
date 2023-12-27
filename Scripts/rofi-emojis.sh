#!/bin/bash
cat ~/projetos/dotfiles/utils/emojis.txt | rofi -dmenu -i -p " Emojis " | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard

pgrep -x dunst >/dev/null && notify-send -t 950 "$(xclip -o -selection clipboard) Copiado "
