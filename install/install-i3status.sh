#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME"/i3status

ln -sf $DOTFILES/i3status/config "$XDG_CONFIG_HOME"/i3status
