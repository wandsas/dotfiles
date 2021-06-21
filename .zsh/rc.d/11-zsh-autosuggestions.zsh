# Activate autosuggestions and/or incremental completion
# (https://github.com/zsh-users/zsh-autosuggestions/)

zshrc_autosuggestions () {
    . ~/.local/lib/zsh-autosuggestions.zsh NIL || return
}

if [[ -z "${ZSHRC_SKIP_AUTOSUGGESTIONS:++}" ]] && is-at-least 4.3.11
then    zshrc_autosuggestions
fi
