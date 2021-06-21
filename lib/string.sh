#!/bin/sh

strlen () {
    local length=$(echo "$1" | wc -c | sed -e 's/ *//')
    echo "$(expr $length - 1)"
}

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
