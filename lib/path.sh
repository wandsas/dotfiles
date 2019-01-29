#
# Add to PATH helper
#
pathmunge () {
	if ! echo $path | grep -qE "(^|:)$1($|:)"
	then
        if [[ "$2" = "after" ]]; then
            path=(${path} $1)
        else
            path=($1 $path)
        fi
    fi
}

#
# Remove from PATH
#
pathremove () {
    if [[ -n "$ZSH_VERSION" ]]; then
	    path=(${path#$1})
	else
        PATH=$(echo ${PATH} | sed -e 's;:\?$%{1};;' -e 's;${1}:\?;;')
    fi
}

#
# Convert a path form relative to abolut
#
relative2absolut () {
    local relpath_="$1"
    local abspath_=''

    abspath_="`readlink -f \"$relpath_\"`" || \
    warn "$0: Problems getting absolute path" "$?" || return 1
    dprint "$0: \"$relpath_\" => \"$abspath_\""
    echo "$abspath_"
}
