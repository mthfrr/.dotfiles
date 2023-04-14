#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/gdb"

ln -sf "$DOTFILES/gdb/gdbinit" "$XDG_CONFIG_HOME/gdb/"
ln -sf "$DOTFILES/gdb/gdbearlyinit" "$XDG_CONFIG_HOME/gdb/"
