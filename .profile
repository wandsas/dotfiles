# .profile: POSIX-compatible shell login script

if [ -f /etc/profile ]; then
    . /etc/profile
fi

# Set default values for required environment variables
HOSTNAME=${HOSTNAME:-${HOST}}
HOSTNAME=${HOSTNAME:-$(hostname)}
LOGNAME=${LOGNAME:-${USER}}
LOGNAME=${LOGNAME:-$(id -un)}

# POSIX variables
# see http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03
export HOME=${HOME:-/home/${LOGNAME}}
export HOSTNAME=${HOSTNAME}
export LOGNAME=${LOGNAME}
export PATH=${HOME}/bin:${HOME}/.local/bin:${PATH}

# XDG path variables
# see https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share

# XDG system path variable
# see https://standards.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/${LOGNAME}}

test -d ${XDG_RUNTIME_DIR} || install -d -m0700 -o${LOGNAME} -g${LOGNAME} ${XDG_RUNTIME_DIR}

# other variables
export EDITOR=nvim
export GIMP2_DIRECTORY=${XDG_CONFIG_HOME}/gimp
export GOBIN=${HOME}/.local/bin
export GOPATH=${HOME}/.local/lib/go
export GHQ_ROOT=/home/wandsas/repos
export GPG_TTY=$(tty)
export GTK2_RC_FILES=${XDG_CONFIG_HOME}/gtk-2.0/gtkrc
export GTK_IM_MODULE=xim
export GUILE_LOAD_PATH=
export I3SOCK=${XDG_RUNTIME_DIR}/i3/socket
export LANG=en_US.UTF-8
export LC_COLLATE=C
export LESS="-R -M"
export LESSHISTFILE=${XDG_CACHE_HOME}/history/less
export LESSOPEN="|lesspipe %s"
export MAKEFLAGS="-j$(($(getconf _NPROCESSORS_ONLN)+1)) --no-print-directory"
export MPD_HOST=${XDG_RUNTIME_DIR}/mpd
export npm_config_prefix=${XDG_CONFIG_HOME}/npm-global
export NODE_PATH=${npm_config_prefix}/lib/node_modules
export PAGER=less
export PASSWORD_STORE_ENABLE_EXTENSIONS=1
export NO_AT_BRIDGE=1
export RXVT_SOCKET=${XDG_RUNTIME_DIR}/urxvtd
export SSH_AGENT_PID=
export SSH_ASKPASS=x11-ssh-askpass
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SUDO_ASKPASS=x11-ssh-askpass
export TMUX_TMPDIR=${XDG_RUNTIME_DIR}
export WEECHAT_HOME=${XDG_CONFIG_HOME}/weechat
export WEGORC=${XDG_CONFIG_HOME}/wegorc
export JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -XX:-UsePerfData"
export QT_STYLE_OVERRIDE=GTK+

gpg-connect-agent RELOADAGENT /bye &>/dev/null

# vim:fenc=utf-8:ft=sh:
