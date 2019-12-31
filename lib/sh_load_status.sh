#!/usr/bin/env sh

# Loading status

# Default to 1, and treat empty as 0.  This ensures we have an integer.
: ${DEBUG_LOCAL_HOOKS=1}
: ${DEBUG_LOCAL_HOOKS:=0}

sh_load_status () {
  # Find the name of the running shell
  _this_shell=${shell:-${0##*/}}

  # Find the filename of the running script
  if [ -n "$BASH_SOURCE" ]; then
    _this_script="${BASH_SOURCE[0]}"
    # Deduct 1 because array starts at 0, and another 1 because
    # we want to ignore this stack frame (inside sh_load_status)
    _this_script="${BASH_SOURCE[$(( ${#BASH_SOURCE[@]} - 2))]}"
    # Sheesh.  $ZSH_SOURCE[-2], anyone?
  else
    _this_script="$0"
    # Unfortunately in zsh there seems to be no way of determining
    # the currently running file if a function is being run, unless
    # function_argzero is unset :-/
    [ "$_this_script" = sh_load_status ] && _this_script=
    [ "$_this_script" = -zsh ] && _this_script=
  fi
  [ -n "$_this_script" ] && _this_script="[$_this_script]"

  # Leave status printed?

  if [ "$DEBUG_LOCAL_HOOKS" -ge 2 ]; then
    debug="\n"
  fi

  # \e[0K is clear to right
  if [ -n "$shell_interactive" ] && [ "$TERM" != 'dumb' ]; then
    _text="${_this_shell}${_this_script}: $*... "
    _text="${_text//\/home\//~}"
    echo -e -n "\r\e[0K$_text$debug"
  fi
}

# vim:ft=sh:fenc=utf-8:
