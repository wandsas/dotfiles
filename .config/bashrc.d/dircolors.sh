# 256 color jellybeans theme for the color GNU ls utility
# Used and tested with dircolors (GNU coreutils) 8.13
#
# More information at
# https://github.com/peterhellberg/dircolors-jellybeans
#
#
# Standard colors
#
# Below are the color init strings for the basic file types. A color init
# string consists of one or more of the following numeric codes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#
#
# 256 color support
# http://www.mail-archive.com/bug-coreutils@gnu.org/msg11030.html


use_color=false
if type -P dircolors >/dev/null ; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    LS_COLORS=
    if [ -f ${XDG_CONFIG_HOME}/dir_colors ]; then
        eval "$(dircolors -b ~/.dir_colors)"
    elif [ -f /etc/DIR_COLORS ]; then
        eval "$(dircolors -b /etc/DIR_COLORS)"
    else
        eval "$(dircolors -b)"
    fi
	# Note: We always evaluate the LS_COLORS setting even when it's the
	# default.  If it isn't set, then `ls` will only colorize by default
	# based on file attributes and ignore extensions (even the compiled
	# in defaults of dircolors). #583814
	if [[ -n ${LS_COLORS:+set} ]] ; then
		use_color=true
	else
		# Delete it if it's empty as it's useless in that case.
		unset LS_COLORS
	fi
fi

if ${use_color} ; then
	alias ls='command ls --color=auto'
    alias ll='command ls --color=auto -lh't
    alias la='command ls --color=auto -a'
    alias  l='command ls --color=auto -lhA'
	alias grep='command grep --colour=auto'
	alias egrep='command egrep --colour=auto'
	alias fgrep='command fgrep --colour=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'
    export LESS_TERMCAP_md=$'\E[1;38;5;74m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0'
    export LESS_TERMCAP_so=$'\E[1;3;5;2'
    export LESS_TERMCAP_ue=$'\E[0'
    export LESS_TERMCAP_us=$'\E[1;32m'
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color sh

# vim:fenc=utf-8:ft=sh:
