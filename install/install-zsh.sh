#!/bin/sh

mkdir -p "$ZDOTDIR"

dot_info "yay -S --noconfirm zsh-theme-powerlevel10k-git"

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"

ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
ln -sf "$DOTFILES/zsh/p10k.zsh" "$ZDOTDIR/.p10k.zsh"

ln -sf "$DOTFILES/aliases.sh" "$XDG_CONFIG_HOME/aliases.sh"

# https://github.com/jeffreytse/zsh-vi-mode
ln -sf "$DOTFILES/zsh-vi-mode" "$XDG_CONFIG_HOME/zsh-vi-mode"
cd zsh-vi-mode
git pull
cd -
