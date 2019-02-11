echo ~/.config/zsh/rc.d/dircolors.zsh

(( $+commands[dircolors] )) && {
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	LS_COLORS=
    if [[ -r "$HOME/.dir_colors" ]] {
        eval $(dircolors -b ~/.dir_colors)
    } elif [[ -r "/etc/DIR_COLORS" ]] {
        eval $(dircolors -b /etc/DIR_COLORS)
    } else { eval $(dircolors -b) }

    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'
    export LESS_TERMCAP_md=$'\E[1;38;5;74m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[1;3;5;246m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[1;32m'
}

# vim:fenc=utf-8:ft=sh:
