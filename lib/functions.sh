# vim:fencoding=utf-8:filetype=sh:

#
# Print a info message
#
info () {
	echo -e "\e[1;34mINFO\e[0m: ${@}"
}

#
# Print a warning message
#
warn () {
	echo -e "\e[1;33mWARN\e[0m: ${@}" >&2
}

#
# Print a error message
#
error () {
	echo -e "\e[1;31mERROR\e[0m: ${@}" >&2
}

#
# Print a error message and exit with (negative)return-code
#
die () {
	local ret="$?"; error "$@"; exit "$ret"
}
