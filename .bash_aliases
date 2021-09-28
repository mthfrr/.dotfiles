
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
alias gitc="git commit -m "
alias gitt="git tag -a "
alias gitp="git push --follow-tags"
alias gitl="git log -20 --oneline"

gitct() {
    [ $# -ne 2 ] && echo "Usage: $0 [tag-name-base] [commit-msg]" && return 1
    epoch=$(date +%s)
    git commit -m "$2"
    git tag -a "$1$epoch" -m "$2" 
}

alias decolorize='sed -r "s/\\x1B\\[([0-9]*(;)?){0,3}[mGK]//g"'
