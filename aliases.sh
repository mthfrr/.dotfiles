#!/bin/sh

alias ls='ls -h --color'
alias lx='ls -lXB' #  Sort by extension.
alias lk='ls -lSr' #  Sort by size, biggest last.
alias l="ls -lv --group-directories-first"
alias ll="ls -lav --group-directories-first"
alias cf='clang-format --style=FILE $(find . -type f -name "*.[ch]")'
alias j='jobs -l'
alias j1='fg %1'
alias j2='fg %2'
alias j3='fg %3'
alias ip='ip --color=auto'
alias tree='tree -C' # force colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

alias venv='. .*/bin/activate'

alias arch-update='sudo pacman -Syu && yay -Syu && fwupdmgr refresh && sudo fwupdmgr update'

# reload
if ps -p$$ -ocmd= | grep -q zsh; then
	alias reload_zsh=". $ZDOTDIR/.zshrc $ZDOTDIR/.zshenv"
fi

mktouch() {
	mkdir -p "$(dirname "$1")" && touch "$1"
}
