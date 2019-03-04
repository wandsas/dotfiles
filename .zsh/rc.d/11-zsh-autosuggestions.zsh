# Activate autosuggestions and/or incremental completion from one of
# https://github.com/zsh-users/zsh-autosuggestions/
#   (at the time of writing this, branch develop supports completion)

zshrc_autosuggestions() {
	is-at-least 4.3.11 || return
	path=(
		/usr/share/zsh/site-contrib/zsh-autosuggestions
		$path
	) . zsh-autosuggestions.zsh NIL || return
	if [[ $(echotc Co) -ge 256 ]]
	then	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=99,bold,bg=18'
	else	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold,bg=magenta'
	fi
	typeset -g ZSH_AUTOSUGGEST_USE_ASYNC=true
	typeset -gUa  ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS \
		ZSH_AUTOSUGGEST_ACCEPT_WIDGETS ZSH_AUTOSUGGEST_EXECUTE_WIDGETS \
		ZSH_AUTOSUGGEST_CLEAR_WIDGETS
	typeset -ga ZSH_AUTOSUGGEST_STRATEGY
	ZSH_AUTOSUGGEST_STRATEGY=(completion history)
	ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#*forward-char})
	ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char vi-forward-char)
	autosuggest-self-insert-clear() {
		zle self-insert
		_zsh_autosuggest_clear
	}
	zle -N autosuggest-self-insert-clear
	zshrc_bindkey autosuggest-self-insert-clear "#"
	if [[ -z "${ZSHRC_AUTO_ACCEPT:++}" ]]
	then	if [[ $(echotc Co) -ge 256 ]]
		then	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=136,bg=235'
		else	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold,bg=magenta'
		fi
	else	if [[ $(echotc Co) -ge 256 ]]
		then	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=99,bold'
		else	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246,bold'
		fi
		zle -N autosuggest-accept-line _zsh_autosuggest_execute
		zshrc_bindkey autosuggest-accept-line "^M"
	fi
}

if [[ -z "${ZSHRC_SKIP_AUTOSUGGESTIONS:++}" ]]
then    zshrc_autosuggestions
fi
