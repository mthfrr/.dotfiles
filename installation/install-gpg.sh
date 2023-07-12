#!/bin/sh

mkdir -p "$GNUPGHOME"
chmod 700 "$GNUPGHOME"

ln -sf "$DOTFILES/gnupg/gpg.conf" "$GNUPGHOME"
ln -sf "$DOTFILES/gnupg/gpg-agent.conf" "$GNUPGHOME"
