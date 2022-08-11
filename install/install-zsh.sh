#!/bin/sh

mkdir -p "$ZDOTDIR"

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"

ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
ln -sf "$DOTFILES/zsh/prompt.sh" "$ZDOTDIR/prompt.sh"

ln -sf "$DOTFILES/aliases.sh" "$XDG_CONFIG_HOME/aliases.sh"
