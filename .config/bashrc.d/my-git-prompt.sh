# ~/.config/bashrc.d/my-git-prompt.sh

# No git-prompt for root.
[ $EUID == 0 ] && return

# If git-prompt.sh not available -> No git-prompt for all users
[ -r $XDG_CONFIG_HOME/bashrc.d/git-prompt.sh ] || return

# Update git-prompt.sh 

# Git properties
# Overridable by bash.showDirtyState=true
GIT_PS1_SHOWDIRTYSTATE=true

# If something is stashed, a '$' will be shown next to the branch name-  
GIT_PS1_SHOWSTASHSTATE=

GIT_PS1_SHOWUNTRACKEDFILES=true

# Overridable by bash.showUpstream=auto
# Auto or comma separated list of: verbose, name, legacy, git, svn 
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_HIDE_IF_PWD_IGNORED=true

GIT_PS1_STATESEPARATOR=

# when there is an in-progress operation (merge, rebase) running,
# a "|OPERATION-NAME" is included.
# a "|SPARSE" is included for a sparse-checkout.
GIT_PS1_COMPRESSSPARSESTATE=?
GIT_PS1_OMITSPARSESTATE=

# contains, branch, describe, tag, default 
GIT_PS1_DESCRIBE_STYLE=branch,tag.default

unset PS1
# Window title
PS1='\[\033]0;\u@\h:\w\007'
# Prompt
PS1+='\[\033[01;32m\]\u@\h\[\033[00m\]$(__git_ps1 " (%s)") \[\033[01;34m\]\W \$\[\033[00m\] '

