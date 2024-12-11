#!/bin/sh

set -e

mkdir -p "$XDG_CONFIG_HOME/fish"

for p in config.fish functions completions conf.d; do
  ln -sf "$DOTFILES/fish/$p" "$XDG_CONFIG_HOME/fish/$p"
done

for p in completions conf.d functions; do
  cp -R "$DOTFILES/tide/$p" "$DOTFILES/fish/"
done
