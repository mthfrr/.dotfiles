#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/python"

ln -sf "$DOTFILES/python/pythonrc" "$XDG_CONFIG_HOME/python"
