#!/bin/sh

set -e

. ./colors.sh
. ./install_functions.sh
. ./zsh/zshenv

warn "Warning, current configuration files will be overwritten. (y/n)"
read -r -n 1 -s answer
[ "$answer" != "y" ] && echo Abort && exit 0

INSTALL="$DOTFILES"/install

# Install the configuration files
dot_install zsh

dot_is_installed clang-format && dot_install clang-format
dot_is_installed nvim         && dot_install nvim
dot_is_installed git          && dot_install git
dot_is_installed i3           && dot_install i3
dot_is_installed kitty        && dot_install kitty
