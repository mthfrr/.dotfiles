#!/bin/sh

set -e


. ./colors.sh
. ./install_functions.sh
. ./zsh/zshenv

dot_info "Pull last commits"
git pull
dot_info "Pull submodules"
git submodule update --init
dot_info "Update submodules"
git submodule foreach git pull origin master

INSTALL="$DOTFILES"/install

if [ $# -ne 0 ]; then

    for p in "$@"; do
        dot_is_installed "$p" && dot_install "$p"
    done

else
    dot_warn "Warning, current configuration files will be overwritten. (y/n)"
    read -r -n 1 -s answer
    [ "$answer" != "y" ] && echo Abort && exit 0

    # Install the configuration files
    dot_install zsh

    dot_is_installed clang-format && dot_install clang-format
    dot_is_installed nvim         && dot_install nvim
    dot_is_installed git          && dot_install git
    dot_is_installed i3           && dot_install i3
    dot_is_installed i3status     && dot_install i3status
    dot_is_installed kitty        && dot_install kitty
    dot_is_installed ssh          && dot_install ssh

fi
