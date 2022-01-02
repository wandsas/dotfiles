# .bashrc

[[ $- != *i* ]] && return   # Shell is non-interactive. Be done now!

set -o vi
stty -ixon
shopt -qs extglob

## Some minimal local user aliases.
alias ll='ls -lh'
alias la='ls -a'
alias  l='ls -lha'
alias cls='tput reset'

## Load local bash user environment
if [ -d $XDG_CONFIG_HOME/bashrc.d ]; then
  for sh in $XDG_CONFIG_HOME/bashrc.d/*.sh; do
    [ -r "$sh" ] && . "$sh"
  done
  unset sh
fi

## Load some more local user aliases, if available.
[ -r ~/.aliases.sh ] && . ~/.aliases.sh

complete -cd doas
