info () {
	echo -e "\e[1;34mINFO\e[0m: ${@}"
}

warn () {
	echo -e "\e[1;33mWARN\e[0m: ${@}" >&2
}

error () {
	echo -e "\e[1;31mERROR\e[0m: ${@}" >&2
}

die () {
	local ret="$?"; error "$@"; exit "$ret"
}
