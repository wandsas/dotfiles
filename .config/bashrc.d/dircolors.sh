# dircolors.sh

if [ -f ~/.dir_colors ]; then
    eval "$(dircolors -b ~/.dir_colors)"
elif [ -f /etc/DIR_COLORS ]; then
    eval "$(dircolors -b /etc/DIR_COLORS)"
else
    eval "$(dircolors -b)"
fi

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -a'
alias  l='ls -lhA'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0'
export LESS_TERMCAP_so=$'\E[1;3;5;2'
export LESS_TERMCAP_ue=$'\E[0'
export LESS_TERMCAP_us=$'\E[1;32m'
