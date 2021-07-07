# ~/.config/bashrc.d/05-bash-history.sh

# GNU Bash history

shopt -s cmdhist
shopt -s histappend
HISTFILE=$XDG_CACHE_HOME/bash_history
HISTCONTROL=ignoredups:ignorespace
HISTIGNORE=ls:ps:history
HISTSIZE=1000
HISTFILESIZE=1000
HISTTIMEFORMAT="%h %d %H:%M:%S "
HISTFILE=$XDG_CACHE_HOME/bash_history
alias h=history

if [ ! 'history -a;history -c;history -r;' = '*${PROMPT_COMMAND}*' ]; then
  PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"
fi
