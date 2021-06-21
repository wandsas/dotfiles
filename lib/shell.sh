#!/bin/sh

# Running session is interactive
is_interactive () {
	case "${-}" in
	  *i*) ;;
		  *) return;;
	esac
}

# Running a login shell
is_login_shell () {
  [[ "$SHLVL" = 1 ]]
}

# Running shell is zsh
is_zsh () {
	[[ -n "$ZSH_VERSION" ]]
}

# Running shell is bash
is_bash () {
  [[ -n "$BASH_VERSION" ]]
}

# Binary check helper
check_bin () {
	local _cmd
	for _cmd; do
		type -p $_cmd 1>$NULL 2>&1 || return
	done
}
