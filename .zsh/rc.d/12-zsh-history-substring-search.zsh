# Zsh clean-room implementation of Fish shell's history search feature
# (https://github.com/zsh-users/zsh-history-substring-search)

zshrc_history_substring_search () {
	. ~/.local/lib/zsh-history-substring-search.zsh NIL || return
}

if [[ -z "${ZSHRC_SKIP_HISTORY_SUBSTRING_SEARCH:++}" ]] && is-at-least 4.3.11
then    zshrc_history_substring_search
fi
