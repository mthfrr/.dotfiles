#!/bin/sh

set -e

mkdir -p "$XDG_CONFIG_HOME/fish"

for p in config.fish functions completions conf.d; do
  ln -sf "$DOTFILES/fish/$p" "$XDG_CONFIG_HOME/fish/"
done

for p in completions conf.d functions; do
  cp -R "$DOTFILES/tide/$p" "$DOTFILES/fish/"
done

fish -c "tide configure --auto --style=Lean --prompt_colors='True color' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Dotted --prompt_connection_andor_frame_color=Darkest --prompt_spacing=Compact --icons='Few icons' --transient=No"
