#!/usr/bin/env sh

#
# Check if running session is interactive
#
is_interactive () {
	case "${-}" in
		*i*) ;;
		  *) return;;
	esac
}

#
# Check if running a login shell
#
is_login_shell () {
    [[ "$SHLVL" = 1 ]]
}

#
# Check if shell is zsh
#
is_zsh () {
	[[ -n "$ZSH_VERSION" ]]
}

#
# Check if shell is bash
#
is_bash () {
    [[ -n "$BASH_VERSION" ]]
}

# vim:ft=sh:fenc=utf-8:
