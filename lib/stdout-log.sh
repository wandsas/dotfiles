# stdout-log.sh

# Ansi colors
black="\033[0;90m"
red="\033[0;91m"
green="\033[0;92m"
yellow="\033[0;93m"
blue="\033[0;94m"
magenta="\033[0;95m"
cyan="\033[0;96m"
bold="\033[1m"
underline="\033[4m"
reset="\033[m"


info () {
	printf "${green}INFO:${reset} ${@}\n" >&2
}

msg () {
  # bold/green
  printf "${bold}${greem}==> ${reset} $@\n" >&2
}

success () {
  # bold/green
  printf "${bold}${green}OK: ${reset}\n" >&2
}

warn () {
	printf "${yellow}WARN:${reset} ${@}\n" >&2
}

error () {
	printf "${red}ERROR:${reset} ${@}\n" >&2
}

die () {
    local ret="$?"; error "$@"; exit "$ret"
}

# Try to keep the environmenet pollution down, EPA loves us
unset black red green yellow blue magenta cyan bold underline reset
