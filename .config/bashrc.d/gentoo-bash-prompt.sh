if ! [ -f ${XDG_CONFIG_HOME}/git/git-prompt.sh ]; then
    curl -o ${XDG_CONFIG_HOME}/git/git-prompt.sh \
        -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

. ${XDG_CONFIG_HOME}/git/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_DESCRIBE_STYLE=auto
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_HIDE_IF_PWD_IGNORED=true

PROMPT_COMMAND='history -a;__git_ps1 "\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]" " \\\$ "'
