#
# MR skip helper functions
#

debug () {
    if [ -n "$MR_DEBUG_SKIP" ]; then
        echo "# SKIP $MR_NAME?  $*"
    fi
}

not_linux () {
    [ `uname` != Linux ]
}

not_darwin () {
    [ `uname` != Darwin ]
}

not_gentoo () {
    not_linux || [[ -z `cat /etc/gentoo-release` ]]
}

missing_exe () {
    if [ $# != 1 ]; then
	echo >&2 "BUG: missing_exe called with parameters: $*"
	exit 1
    fi
    if which "$1" >/dev/null 2>&1; then
        debug ". Found $1 in \$PATH"
        return 1 # false
    else
        debug "! Didn't find $1 in \$PATH"
        return 0 # true
    fi
}

missing_exes () {
    for i in "$@"; do
	if missing_exe "$i"; then
	    return 0 # true
	fi
    done
    return 1 # false
}

missing_file () {
    if [ -f "$1" ]; then
        debug ". Found $1"
        return 1 # false
    else
        debug "! Didn't find $1"
        return 0 # true
    fi
}

missing_dir () {
    if [ -d "$1" ]; then
        debug ". Found $1"
        return 1 # false
    else
        debug "! Didn't find $1"
        return 0 # true
    fi
}

z800 () {
    test $(uname -n) = z800
}

wandsas () {
    [[ "$USER" = wandsas ]]
}

root () {
    [[ "$USER" = root ]]
}

hours_since () {
    [ "$1" = update ] && ! hours_since "$1" 12
}

on () {
    for host in $@; do
        if [ "${host%@*}" != "${host#*@}" ]; then
            if [ "$(whoami)" != "${host%@*}" ]; then
                continue
            fi
            host="${host#*@}"
        fi
        if [ "$(hostname)" = "$host" ]; then
            return 0
        fi
    done
    return 1
}

myworkstation () {
    on wandsas@z800
}

# vim:fenc=utf-8:ft=sh:
