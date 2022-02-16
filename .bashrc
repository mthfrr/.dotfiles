#!/bin/bash
# ~/.bashrc


if [ -f /etc/bashrc ]; then
    . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

case $- in
    *i*) ;;
      *) return;;
esac

######## Shell setup ########

# History setup
history -a

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

######## PS1 Setup ########

NC="\e[m"               # Color Reset

# get current branch in git repo
parse_git_branch() {
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=$(parse_git_dirty)
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
parse_git_dirty() {
    status=$(git status 2>&1 | tee)
    dirty=$(echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?")
    untracked=$(echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?")
    ahead=$(echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?")
    newfile=$(echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?")
    renamed=$(echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?")
    deleted=$(echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?")
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

exit_status(){
    code=$?
    if [ $code -eq 0 ]; then
        color+="\e[30;102m"
    else
        color+="\e[1;37;41m"
    fi
    offset=$(echo "scale=0; 3 - (l($code)/l(10)) / 1" | bc -l)
    output=""
    for _ in $(seq 1 "$offset"); do
        output+=" "
    done
    echo -e "${NC}${color}${output}${code} ${NC}"
}

prompt_time(){
    echo -e "\e[30;43m $(date +"%T") ${NC}"
}
git_msg() {
    msg=$(parse_git_branch)
    if [ ${#msg} -eq 0 ]; then echo ""
    else echo -e "\e[1;37;45m ${msg} ${NC}"
    fi
}
alias decolorize='sed -r "s/\\x1B\\[([0-9]*(;)?){0,3}[mGK]//g"'
rightprompt(){
    rps1="$(git_msg)$(prompt_time)\$(exit_status)"
    rps1_stripped=$(echo "$rps1" | decolorize)
    len_stripped=${#rps1_stripped}
    offset=$((COLUMNS - len_stripped + 9))
    padding="\e[37m"
    for _ in $(seq "$offset"); do padding+=" "; done
    printf "%s%s" "$padding" "$rps1"
}
build_prompt2(){
    PS1="\[$(tput sc; rightprompt; tput rc)\]\[\e[30;103m\] \u@\h \[\e[30;102m\] \w \[${NC}\]\n\[\e[33m\]\$ \[${NC}\]"
}

PROMPT_COMMAND=build_prompt2


######### Load aliases ########

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

######### Add to PATH ########

[ -d ~/.local/bin ] && export PATH=$PATH:$HOME/.local/bin
[ -d ~/afs/bin ] && export PATH=$PATH:$HOME/afs/bin
[ -d ~/bin ] && export PATH=$PATH:$HOME/bin


######## KITTY SHELL ########

if which kitty > /dev/null 2>&1; then
    if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
fi

######## Load specifique setup #########

[ -f ~/.bashrc_local ] && source ~/.bashrc_local
