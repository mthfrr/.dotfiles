alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.

alias l="ls -lv --group-directories-first"
alias ll="ls -lav --group-directories-first"
alias lm='ll | less'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.

alias cf='clang-format --style=FILE $(find . -type f -name "*.[ch]")'

alias j='jobs -l'

alias ip='ip --color=auto'

alias tree='tree -C'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

alias venv='. .*/bin/activate'

# reload
if ps -p$$ -ocmd= | grep -q zsh; then
    alias reload_zsh=". $ZDOTDIR/.zshrc"
fi

mktouch() { mkdir -p "$(dirname "$1")" && touch "$1"; }

calc_new_tag() {
    [ $# -ne 1 ] && echo "Usage: $0 [tag-name-base]" && return 1
    prev_tag=$(git tag --sort=creatordate | sed -n "s/.*\($1.*\).*/\1/p" | tail -n 1)
    base_wo_dash=$(echo "$1" | sed -E "s/-\$//")
    if [ -z "$prev_tag" ]; then
        echo "$base_wo_dash"-1
    else
        ending=$(echo "$prev_tag" | grep -o "[0-9]*$")
        ending=$((ending + 1))
        while git tag | grep -q "$base_wo_dash-$ending"
        do
            ending=$((ending + 1))
        done
        echo "$base_wo_dash-$ending"
    fi
}

gitt() {
    [ $# -ne 1 ] && echo "Usage: $0 [tag-name-base]" && return 1
    new_tag=$(calc_new_tag "$1" )
    echo Tag "$new_tag" ?
    read -r -p "Are you sure? [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY])
            git tag -a "$new_tag" -m "-"
            ;;
        *)
            echo $(git tag --sort=creatordate | grep "$1")
            ;;
    esac
}

gitct() {
    [ $# -ne 2 ] && echo "Usage: $0 [tag-name-base] [commit-msg]" && return 1
    git commit -m "$2"
    gitt "$1"
}

git-tag-all() {
    tags=( $(git tag | sed -E "s/(^[^-]*-[^-]*-).*$/\1/" | sort | uniq | tr '\n' ' ') )
    echo "${#tags[@]}" tags
    for i in "${tags[@]}"; do
        #echo "$i$1"
        gitt "$i"
        #git tag -a "$i$1" -m "re-tag all"
    done
}

gituctp() {
    if [ $# -ne 0 ]; then
        tag=exercises-${PWD##*/}
        cmt_msg="$*"
        gituctp_manual_tag "$tag" "$cmt_msg"
    else
        echo "Usage: $0 commit-msg" && return 1
    fi
}

gituctp_manual_tag() {
    [ $# -lt 2 ] && echo "Usage: $0 [tag-name-base] [commit-msg]" && return 1
    gitu
    echo "$2"
    yes | gitct "$1" "$2"
    gitp
}
