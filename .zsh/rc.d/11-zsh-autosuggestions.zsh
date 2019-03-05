# Activate autosuggestions and/or incremental completion
# (https://github.com/zsh-users/zsh-autosuggestions/)

zshrc_autosuggestions () {
	path=(
		/usr/share/zsh/site-contrib/zsh-autosuggestions
		$path
	) . zsh-autosuggestions.zsh NIL || return
}

if [[ -z "${ZSHRC_SKIP_AUTOSUGGESTIONS:++}" ]] && is-at-least 4.3.11
then    zshrc_autosuggestions
fi
