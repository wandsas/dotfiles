# ~/.config/bashrc.d/bash-completion.sh
#
# Configuration of Bash History
#

shopt -s cmdhist
shopt -s histappend
[ -d $XDG_CACHE_HOME ] || mkdir -p $XDG_CACHE_HOME

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTCONTROL=ignoredups:ignorespace:erasedups
HISTIGNORE=ls:ps:history
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%h %d %H:%M:%S "
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
HISTFILE=${XDG_CACHE_HOME:-$HOME/.cache}/bash_history
LESSHISTFILE=$XDG_CACHE_HOME/less_history

export PROMPT_COMMAND="history -a; history -c; history -r;  $PROMPT_COMMAND"
