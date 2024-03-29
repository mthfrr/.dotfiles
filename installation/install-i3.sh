#!/bin/sh

mkdir -p "$I3_CONFIG"

if ! command -v "mediactl" > /dev/null; then
    wget -O /tmp/mediactl https://github.com/aaaaaaaalex/mediactl/releases/download/1.0.0/mediactl
    chmod +x /tmp/mediactl
    sudo mv /tmp/mediactl /usr/bin/mediactl
fi

# ln -sf $DOTFILES/i3/lock.png $I3_CONFIG
ln -sf "$DOTFILES/i3/config" "$I3_CONFIG"
