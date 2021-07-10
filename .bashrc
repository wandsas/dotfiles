# ~/.bashrc

[[ $- != *i* ]] && return   # Shell is non-interactive. Be done now!

# vi keybindings
set -o vi

# ctrl+p/n 
bind '"\ep":history-search-backward'
bind '"\en":history-search-forward'
bind '"\e\C-i":dynamic-complete-history'
# ctrl+w
bind '"\C-w": backward-kill-word'

stty -ixon
shopt -qs extglob
#shopt -qs nullglob
shopt -s cdspell
shopt -s extglob
shopt -s cdable_vars
shopt -s no_empty_cmd_completion
shopt -s checkwinsize

### GNU Bash history  ###
shopt -s histappend # append commands to the history file
shopt -s cmdhist    # multi-line commands in one history entry
HISTCONTROL=ignoredups:ignorespace,erasedups
HISTIGNORE=ls:ps:history
HISTSIZE=1000
HISTFILESIZE=1000
HISTTIMEFORMAT="%h %d %H:%M:%S "
#PROMPT_COMMAND="history -a;history -c;history -r; $PROMPT_COMMAND"
HISTFILE=$XDG_CACHE_HOME/bash_history

### Change window title of X terminals ###
case ${TERM} in
	xterm*|rxvt*|tmux*|alacritty*|kitty*|*color)
		PS1='\[\033]0;\u@\h:\w\007\]';;
	screen*)
		PS1='\[\033k\u@\h:\w\033\\\]';;
	*)
		unset PS1;;
esac

### Gentoo Default Prompt ###
if [ $EUID == 0 ]; then
    PS1+='\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '
else
    PS1+='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
fi

### Enable dircolors color support ###
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
alias cls='tput reset'

# Load local bash user environment
if [ -d $XDG_CONFIG_HOME/bashrc.d ]; then
  for sh in $XDG_CONFIG_HOME/bashrc.d/*.sh; do
    [ -r "$sh" ] && . "$sh"
  done
  unset sh
fi

# Load some more local user aliases, if available.
[ -r ~/.aliases.sh ] && . ~/.aliases.sh
