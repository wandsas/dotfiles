#!/usr/bin/env sh

yesno () {
	case "${1:-NO}" in
	(0|[Dd][Ii][Ss][Aa][Bb][Ll][Ee]|[Oo][Ff][Ff]|[Ff][Aa][Ll][Ss][Ee]|[Nn][Oo])
		return 1;;
	(1|[Ee][Nn][Aa][Bb][Ll][Ee]|[Oo][Nn]|[Tt][Rr][Uu][Ee]|[Yy][Ee][Ss])
		return 0;;
	(*)
		return 2;;
	esac
}

strlen () {
    local length=$(echo "$1" | wc -c | sed -e 's/ *//')
    echo "$(expr $length - 1)"
}

#
# Checks if a string is part of a filename.
# arg1: string to look for
# arg2: filename to check
#
stringinfile () {
	case "$(cat $2)" in
		*$1*) return 0;;
		   *) return 1;;
	esac
}

stringinstring () {
	case "$2" in
		*$1*) return 0;;
		   *) return 1;;
	esac
}

unicode () {
  printf "%b" "\u$1"
}

upper () {
  tr '[:lower:]' '[:upper:]' <<< "$@"
}

lower () {
  tr '[:upper:]' '[:lower:]' <<< "$@"
}

trim () {
  sed -r 's/^\s*(\S)|(\S*)\s*$/\1\2/g' <<< "$@"
}

# vim:ft=sh:fenc=utf-8:
