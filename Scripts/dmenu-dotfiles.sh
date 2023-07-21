#!/bin/bash

TERMINAL="alacritty"

# Definindo editor
EDITOR="nvim"

declare -a dotfiles=(
    "i3 - $HOME/.config/i3/config"
    "alacritty - $HOME/.config/alacritty/alacritty.yml"
    "nvim - $HOME/.config/nvim/init.lua"
    "ranger - $HOME/.config/ranger/rc.conf"
)

# Selecionando o arquivo de configuração
opt=$(printf '%s\n' "${dotfiles[@]}" | dmenu -i -l 5 -p 'Dotfiles  ')

# Formatando com aws para pegar o valor da ultima coluna
file_path=$(printf '%s\n' "$opt" | awk '{print $NF}')

# Abrindo arquivo para edição
alacritty -e $EDITOR $file_path 
