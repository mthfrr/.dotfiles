#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME"/wget

ln -sf "$DOTFILES/wget/wgetrc" "$XDG_CONFIG_HOME/wget/wgetrc"
