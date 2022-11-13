#!/bin/sh

dot_info () {
    printf "$light_gray%s$default\n" "$@"
}

dot_warn () {
    printf "$yellow%s$default\n" "$@"
}

dot_error () {
    printf "$red%s$default\n" "$@"
}

dot_install () {
    [ $# -ne 1 ] && return 1
    printf "Installing $blue%s$default...\n" "$1"
    . "$INSTALL"/install-"$1".sh
}

dot_is_installed() {
    command -v "$1" >/dev/null
}
