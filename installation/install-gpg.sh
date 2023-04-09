#!/bin/sh

mkdir -p "$GNUPGHOME"


ln -sf "$DOTFILES/gnupg/gpg.conf" "$GNUPGHOME"
ln -sf "$DOTFILES/gnupg/gpg-agent.conf" "$GNUPGHOME"
