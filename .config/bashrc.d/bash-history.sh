# ~/.config/bashrc.d/bash-completion.sh
#
# Configuration of Bash History
#

shopt -s histappend
[ -d $XDG_CACHE_HOME ] || mkdir -p $XDG_CACHE_HOME
HISTFILE=${XDG_CACHE_HOME:-$HOME/.cache}/bash_history
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=1000

export PROMPT_COMMAND="history -a; history -c; history -r;  $PROMPT_COMMAND"
