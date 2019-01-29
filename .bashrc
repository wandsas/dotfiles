[[ $TERM = linux ]] && export LC_MESSAGES="C"

umask 022

if [ ~/.profile ]; then
    . ~/.profile
fi

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

set -o vi

HISTCONTROL=ignoredups
HISTFILE=${XDG_CACHE_HOME}/history/bash
HISTFILESIZE=1000
HISTSIZE=1000

shopt -s checkwinsize
shopt -s histappend
stty -ixon

for sh in ${XDG_CONFIG}/bashrc.d/*.sh; do
  [[ -r "${sh}" ]] && source ${sh}
done
