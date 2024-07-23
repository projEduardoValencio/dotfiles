#!/bin/bash

echo "          DOTFILES By Eduardo Valencio"
echo "          ============================"
echo

dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_dir="$HOME/.config"

programas=(
  "nvim"
  "fish"
  "i3"
  "i3blocks"
  "dunst"
  "alacritty"
  "ranger"
  "starship"
  "tmux"
  )

for programa in ${programas[@]}; do
  # Verificando se a pasta existe no dotfiles
  if [ -d "$dotfiles_dir/$programa" ]; then
    echo "Configurando $programa..."

    # Remover configuração se existir
    if [ -d "$config_dir/$programa" ]; then
      rm -rf $config_dir/$programa
    elif [ -L "$config_dir/$programa" ]; then
      rm -f $config_dir/$programa
    fi

    # Criar link simbólico para a pasta do programa no home
    ln -s $dotfiles_dir/$programa $config_dir/$programa
  else
      echo "Configuração para o programa: $programa, não foi encontrada"
  fi
done

echo "Configuração dotfiles finalizada"

