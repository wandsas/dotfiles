#
# Gentoo bash prompt
#

if ! [ -f ~/.git-prompt.sh ]; then
    curl -o ~/.git-prompt.sh -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

source ~/.git-prompt.sh


# Git prompt settings

# unstaged (*) and staged (+)
# git config bash.showDirtyState false
GIT_PS1_SHOWDIRTYSTATE=true

# untracked (%)
# git config bash.showUntrackedFiles false
GIT_PS1_SHOWUNTRACKEDFILES=true

# space separated list of strings "auto verbose name git"
# < you are behind
# > you are ahead
# <> you have diverged
# = no difference
# git config bash.showUpstream false
GIT_PS1_SHOWUPSTREAM=auto

# space separated list of strings "contains branch describe tag default"
# GIT_PS1_DESCRIBE_STYLE=auto

# colored output of "git status -sb"
GIT_PS1_SHOWCOLORHINTS=true

# git config bash.hideIfPwdIgnored false
GIT_PS1_HIDE_IF_PWD_IGNORED=true


# Prompt colors

RED="\[\033[01;31m\]";  BLUE="\[\033[01;34m\]"; RESET="\[\033[00m\]";
CYAN="\[\033[01;36m\]"; GREY="\[\033[01;90m\]";

if [[ ${EUID} == 0 ]] ; then
    PROMPT_COMMAND='history -a; history -n;__git_ps1 "${RED}\h${BLUE} \w${RESET}" " \\\$ "'
else
    PROMPT_COMMAND='history -a; history -n;__git_ps1 "${CYAN}\u@\h${GREY} \w${RESET}" " \\\$ "'
fi

# vim:fenc=utf-8:ft=sh:
