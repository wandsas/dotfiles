# .bashrc voidlinux

[[ $- != *i* ]] && return   # Shell is non-interactive.  Be done now!

set -o vi
stty -ixon
shopt -qs extglob
#shopt -qs nullglob
shopt -s no_empty_cmd_completion
shopt -s checkwinsize
shopt -s histappend # append commands to the history file
shopt -s cmdhist    # multi-line commands in one history entry
HISTCONTROL=ignoredups:ignorespace,erasedups
HISTIGNORE=ls:ps:history
HISTSIZE=1000
HISTFILESIZE=1000
HISTTIMEFORMAT="%h %d %H:%M:%S "
PROMPT_COMMAND="history -a; history -c; history -r;  $PROMPT_COMMAND"
HISTFILE=$XDG_CACHE_HOME/bash_history
LESSHISTFILE=$XDG_CACHE_HOME/less_history

# Change window title of X terminals 
case ${TERM} in
	xterm*|rxvt*|tmux*|alacritty*|kitty*|*color)
		PS1='\[\033]0;\u@\h:\w\007\]';;
	screen*)
		PS1='\[\033k\u@\h:\w\033\\\]';;
	*)
		unset PS1;;
esac


# Gentoo's default prompt.
if [ $EUID == 0 ]; then
    PS1+='\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '
else
    PS1+='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W \$\[\033[00m\] '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ls='ls --color=auto'
    alias ip='ip --color=auto'
fi 

# Some minimal local user aliases.
alias ll='ls -lh'
alias la='ls -a'
alias  l='ls -lha'
alias cls=clear

# Load local user environment settings. 
if [ -d $XDG_CONFIG_HOME/bashrc.d ]; then
  for sh in $XDG_CONFIG_HOME/bashrc.d/*.sh; do
    [ -r "$sh" ] && . "$sh"
  done
  unset sh
fi

# Load more local user bash aliases.
[ -r $XDG_CONFIG_HOME/bash_aliases.sh ] && . $XDG_CONFIG_HOME/bash_aliases.sh
