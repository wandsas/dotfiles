# ansi colors
black="\e[0;90m"
red="\e[0;91m"
green="\e[0;92m"
yellow="\e[0;93m"
blue="\e[0;94m"
magenta="\e[0;95m"
cyan="\e[0;96m"
bold="\e[1m"
underline="\e[4m"
reset="\e[0m"

# tput colors
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
bold=$(tput bold)
underline=$(tput smul)
reset=$(tput sgr0)

# Stdout Log
# RED: Errors
# BLUE: Descriptions
# GREEN: Info, Success
# YELLOW: Warning
# CYAN: Questions
