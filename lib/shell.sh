# ~/lib/shell.sh

### Shell Utility functions ###

# @Test running session is interactive
is_interactive () {
	case "${-}" in
	  *i*) ;;
		  *) return;;
	esac
}

# @Test is login shell
is_login_shell () {
  [ "$SHLVL" = 1 ]
}

# @Test is zsh
is_zsh () {
	[ -n "$ZSH_VERSION" ]
}

# @Test is bash
is_bash () {
  [ -n $BASH_VERSION ]
}

# Binary checker helper
check_bin () {
    type -p ${1} 1>$NULL 2>&1 || return
}
