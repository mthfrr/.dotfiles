#!/bin/sh

if ! diff -q /etc/locale "$DOTFILES/locale"; then
  sudo tee /etc/locale >/dev/null <"$DOTFILES/locale"
fi
