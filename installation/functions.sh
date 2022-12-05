#!/bin/sh

set -e

. "$INSTALL"/colors.sh

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
    . "$INSTALL/install-$1".sh
}

dot_is_installed () {
    command -v "$1" >/dev/null
}

dot_confirm () {
    printf "$green%s (y/n) " "$1"
    read -r -n 1 -s answer
    printf "\r\033[2K\033[39m"
    [ "$answer" != "y" ] && return 1
    return 0
}

update_submodule () {
    [ $# -ne 1 ] && echo "Usage: $0 [submodule folder]" && return 1
    if [ "$(cd "$1"; git tag -l | wc -l)" -eq 0 ]; then
        # has no tags, work with commits
        curr_tag=$(cd "$1" && git rev-parse HEAD)
        last_tag=$(cd "$1" && git log -n 1 --pretty=format:"%H" origin/HEAD)
    else
        curr_tag=$(cd "$1" && git describe --tags --abbrev=0)
        last_tag=$(cd "$1" && git tag | sort -V | tail -n 1)
    fi
    if [ "$curr_tag" != "$last_tag" ]; then
        dot_warn "Out of date: $1 ($curr_tag -> $last_tag)"
        if dot_confirm "Update"; then
            (cd "$1" && git checkout "$last_tag")
            git add "$1"
            git commit -m "submodule: Update $1 ($curr_tag -> $last_tag)"
            git push
        fi
    fi
    return 0
}
