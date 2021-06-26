#!/bin/bash

GIT_PROMPT=$XDG_CONFIG_HOME/bashrc.d/git-prompt.sh
TODAY=$(date +'%Y%m%d_%H%M')

if [ -f $GIT_PROMPT ]; then
    info "Renaming existing git-prompt.sh to git-prompt.sh.${TODAY}"
    mv "${GIT_PROMPT}" "${GIT_PROMPT}.${TODAY}"
fi

info "Downloading file: ${GIT_PROMPT}"
curl -o ../.config/bashrc.d/git-prompt.sh -LO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

