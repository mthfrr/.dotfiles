alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lav --group-directories-first"
alias lm='ll | less'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.

# git alias
alias gita="git add"
alias gitu="git add -u"
alias gits="git status"
#alias gits="git status --short | grep '^[MARCD]'"
alias gitc="git commit -m "
#alias gitt="git tag -a "
alias gitp="git push --follow-tags"
alias gitl="git log -10 --oneline"

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
    [ $# -ne 1 ] && echo "Usage: $0 [tag-ending]" && return 1
    tags=( $(git tag | sed -E "s/(^[^-]*-[^-]*-).*$/\1/" | sort | uniq | tr '\n' ' ') )
    echo "${#tags[@]}" tags
    for i in "${tags[@]}"; do
        #echo "$i$1"
        git tag -a "$i$1" -m "re-tag all"
    done
}

alias decolorize='sed -r "s/\\x1B\\[([0-9]*(;)?){0,3}[mGK]//g"'
