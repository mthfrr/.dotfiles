#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/git"

ln -sf "$DOTFILES/git/gitconfig" "$XDG_CONFIG_HOME/git/config"
