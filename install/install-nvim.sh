#!/bin/sh

# Create all necessary folder for neovim
if [ ! -d "$VIMCONFIG" ]
  then
    mkdir "$VIMCONFIG"

    # install neovim plugin manager
    curl -fLo "$VIMCONFIG"/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# install nvim config
ln -sf "$DOTFILES/nvim/init.vim" "$VIMCONFIG"

# Coc config file
ln -sf "$DOTFILES/nvim/coc-settings.json" "$VIMCONFIG"

# Install all mandatory folders if they don't exist already
mkdir -p "$VIMCONFIG/plugged"
mkdir -p "$VIMCONFIG/backup"
mkdir -p "$VIMCONFIG/undo"
mkdir -p "$VIMCONFIG/swap"
mkdir -p "$VIMCONFIG/after"
