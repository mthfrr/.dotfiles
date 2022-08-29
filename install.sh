#!/bin/sh

set -e

git pull
git submodule update --init

. ./colors.sh
. ./install_functions.sh
. ./zsh/zshenv

dot_warn "Warning, current configuration files will be overwritten. (y/n)"
read -r -n 1 -s answer
[ "$answer" != "y" ] && echo Abort && exit 0

INSTALL="$DOTFILES"/install

# Install the configuration files
dot_install zsh
dot_install zsh-vi-mode

dot_is_installed clang-format && dot_install clang-format
dot_is_installed nvim         && dot_install nvim
dot_is_installed git          && dot_install git
dot_is_installed i3           && dot_install i3
dot_is_installed i3status     && dot_install i3status
dot_is_installed kitty        && dot_install kitty
