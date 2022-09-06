#!/bin/sh

mkdir -p "$I3_CONFIG"

# ln -sf $DOTFILES/i3/lock.png $I3_CONFIG
cp $DOTFILES/i3/config $I3_CONFIG
dot_is_installed i3-gaps && cat $DOTFILES/i3/config-gaps >> $I3_CONFIG
