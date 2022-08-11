#!/bin/sh

warn () {
    printf "$yellow%s$default\n" "$@"
}

error () {
    printf "$red%s$default\n" "$@"
}

dot_install () {
    [ $# -ne 1 ] && return 1
    printf "Installing $blue%s$default...\n" "$1"
    . "$INSTALL"/install-"$1".sh
}

function dot_is_installed() {
    command -v $1 >/dev/null
}
