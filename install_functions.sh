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

dot_is_installed () {
    command -v "$1" >/dev/null
}

update_submodule () {
    [ $# -ne 2 ] && return 1
    (
        cd "$1" || return 1
        curr_tag=$(git describe --tags --abbrev=0)
        last_tag=$(git tag | sort -V | tail -n 1)
        [ "$2" != "$curr_tag" ] && git checkout "$2"
        [ "$2" != "$last_tag" ] && echo "$1 out_of_date $2->$last_tag"
        return 0
    )
    return 0
}
