# ~/lib/colors.sh
#
# RED: Errors
# BLUE: Descriptions
# GREEN: Info, Success
# YELLOW: Warning
# CYAN: Questions

# ansi colors
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


# tput colors
tblack=$(tput setaf 0)
tred=$(tput setaf 1)
tgreen=$(tput setaf 2)
tyellow=$(tput setaf 3)
tblue=$(tput setaf 4)
tmagenta=$(tput setaf 5)
tcyan=$(tput setaf 6)
tbold=$(tput bold)
tunderline=$(tput smul)
treset=$(tput sgr0)

### TESTING ###

printf "${green}INFO:${reset} foo bar bar foo\n"

