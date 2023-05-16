#!/bin/sh

# Create all necessary folder for neovim
# if [ ! -d "$VIMCONFIG" ]
#  then
#    mkdir "$VIMCONFIG"

    # install neovim plugin manager
#    curl -fLo "$VIMCONFIG"/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi

mkdir -p "$VIMCONFIG"
mkdir -p "$VIMCONFIG"/lua

# install NvChad
ln -sf "$DOTFILES/NvChad/init.lua" "$VIMCONFIG/"
ln -sf "$DOTFILES/NvChad/lua/core" "$VIMCONFIG/lua/"
ln -sf "$DOTFILES/NvChad/lua/plugins" "$VIMCONFIG/lua/"

# custom config
ln -sf "$DOTFILES/nvim/custom" "$VIMCONFIG/lua/custom"
