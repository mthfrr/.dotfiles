#!/bin/sh

mkdir -p "$ZDOTDIR"

dot_info "yay -S --noconfirm zsh-theme-powerlevel10k-git"

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"

ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
ln -sf "$DOTFILES/zsh/p10k.zsh" "$ZDOTDIR/.p10k.zsh"

ln -sf "$DOTFILES/aliases.sh" "$XDG_CONFIG_HOME/aliases.sh"
