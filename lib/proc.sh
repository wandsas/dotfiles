#!/usr/bin/env sh

source init.sh
include functions.sh
finish

#
# Check if specified argument is an executable command and current guser is allowed to execute it.
#
executable () {
    command -v "$1" >/dev/null 2>&1
}

#
# Execute specified argument if it's an executable command and current user is allowed to execute it.
#
run_if_executable () {
    if executable "$1"; then
        "$@"
    else
        warn "$1 not executable, aborting."
    fi
}

#
# Checks for a named process running as me
#
process_running_my_uid () {
    proc="$1"
    pgrep -u "`id -un`" "$proc" >/dev/null
}

#
# Runs a named process unless it's already running as me
#
run_unless_running () {
    prog="$1"; shift
    if ! executable_p "$prog"; then
        warn "$prog not executable" >&2
    fi
    process_running_my_uid "$prog" || "$prog" "$@"
}

# If we are running with -e flag, we can watch out for commands failing
# via:
#
# trap check_success_on_exit EXIT
#
# [ do stuff ]
#
# success=hooray # keep exit handler happy

check_success_on_exit () {
    if [ "$success" != 'hooray' ]; then
        cat <<EOF

WARNING: script terminated prematurely!  The last command failed;
please carefully examine the output immediately above this message for
clues as to what went wrong.

EOF
    fi
}

# vim:fenc=utf-8:ft=sh:
