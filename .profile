# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

### POSIX variables ###
# http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03
export LANG=en_US.UTF-8
export LC_COLLATE=C
export EDITOR=vim
export VISUAL=vim
export PAGER=less

### XDG path variables ###
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/run/user/$(id -u)}
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}

# ssh-agent
export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.socket

# X11
export DISPLAY=:0.0
export NO_AT_BRIDGE=1

# Android
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export JAVA_OPTIONS="-XX:-UsePerfData"

# Build a custom user path
prependpath () {
    case ":$PATH:" in
	*":$1:"*) ;;
	*) PATH="$1${PATH:+:$PATH}";;
esac
}

PATH=
prependpath /sbin
prependpath /bin
prependpath /usr/sbin
prependpath /usr/bin
prependpath /usr/local/sbin
prependpath /usr/local/bin
prependpath /snap/bin
prependpath $HOME/.local/bin
prependpath $HOME/bin
unset prependpath
export PATH

# if running bash, source .bashrc if it exists.
[ $BASH_VERSION ] && [ -f ~/.bashrc ] && . ~/.bashrc
