#!/bin/sh

mkdir -p "$ZDOTDIR"

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"

ln -sf "$DOTFILES/zsh/zshenv" "$ZDOTDIR/.zshenv"
ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
ln -sf "$DOTFILES/zsh/zlogout" "$ZDOTDIR/.zlogout"
ln -sf "$DOTFILES/zsh/p10k.zsh" "$ZDOTDIR/.p10k.zsh"

ln -sf "$DOTFILES/aliases.sh" "$XDG_CONFIG_HOME/aliases.sh"
