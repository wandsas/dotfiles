[[ $TERM = linux ]] && export LC_MESSAGES=C

umask 022

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

for sh in ${XDG_CONFIG_HOME}/bashrc.d/*.sh ${XDG_CONFIG_HOME}/aliases.sh; do
  [ -r $sh ] && . $sh
done
unset sh
