#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/git"

ln -sf "$DOTFILES/git/gitconfig" "$XDG_CONFIG_HOME/git/config"
ln -sf "$DOTFILES/git/attributes" "$XDG_CONFIG_HOME/git/attributes"
