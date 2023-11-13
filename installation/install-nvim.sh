#!/bin/sh

rm -rf "$VIMCONFIG"
# mkdir -p "$VIMCONFIG"

# install NvChad
# ln -sf "$DOTFILES/NvChad/init.lua" "$VIMCONFIG"
# ln -sf "$DOTFILES/NvChad/lua/core/" "$VIMCONFIG/lua"
# ln -sf "$DOTFILES/NvChad/lua/plugins/" "$VIMCONFIG/lua"

# custom config
# ln -sf "$DOTFILES/nvim/custom/" "$VIMCONFIG/lua"
# ln -sf "$DOTFILES/nvim/queries" "$VIMCONFIG/queries"

ln -sf "$DOTFILES/nvim" "$VIMCONFIG"
