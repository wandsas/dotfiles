# Activate autosuggestions and/or incremental completion from one of
# https://github.com/zsh-users/zsh-autosuggestions/
#   (at the time of writing this, branch develop supports completion)

# Wrapper function for bindkey: multiple keys, $'$...' refers to terminfo;
# - means -M menuselect

zshrc_autosuggestions() {
	is-at-least 4.3.11 || return
	path=(
		/usr/share/zsh/site-contrib/zsh-autosuggestions
		$path
	) . zsh-autosuggestions.zsh NIL || return
}

if [[ -z "${ZSHRC_SKIP_AUTOSUGGESTIONS:++}" ]]
then    zshrc_autosuggestions
fi
