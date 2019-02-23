# .profile: POSIX-compatible shell login script
echo .profile
# Set default values for required environment variables
LOGNAME=${LOGNAME:-${USER}}
LOGNAME=${LOGNAME:-$(id -un)}
PATH=${PATH:-/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin}

# POSIX variables
# see http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03
export HOME=${HOME:-/home/${LOGNAME}}
export LOGNAME=${LOGNAME}
export PATH=${HOME}/bin:${HOME}/.local/bin:${PATH}
export SHELL=${SHELL:-$(getent passwd "${LOGNAME}" | cut -d: -f7)}

# XDG path variables
# see https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${HOME}/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-${HOME}/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-${HOME}/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/${LOGNAME}}
sudo install -d -m0700 -o ${LOGNAME} -g ${LOGNAME} ${XDG_RUNTIME_DIR}

# XDG system path variable
# see https://standards.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}

# other variables
export LANG=en_US.UTF-8
export LC_COLLATE=C
export TC=Europe/Berlin
export EDITOR=nvim
export PAGER=less
export LESS="-R -M"
export LESSHISTFILE=${XDG_CACHE_HOME}/history/less
export LESSOPEN="|lesspipe %s"
export LESSKEY=${XDG_CACHE_HOME}/less.key
export GIMP2_DIRECTORY=${XDG_CONFIG_HOME}/gimp
export GOBIN=${HOME}/.local/bin
export GOPATH=${HOME}/.local/lib/go
export GTK2_RC_FILES=${XDG_CONFIG_HOME}/gtk-2.0/gtkrc
export NO_AT_BRIDGE=1
export QT_STYLE_OVERRIDE=GTK+
export GHQ_ROOT=${HOME}/repos
export JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true -XX:-UsePerfData"
#export MAKEFLAGS="-j$(($(getconf _NPROCESSORS_ONLN)+1)) --no-print-directory"
export MAKEFLAGS="-j13 --no-print-directory"
export MPD_HOST=${XDG_RUNTIME_DIR}/mpd
export GTK2_RC_FILES=${XDG_CONFIG_HOME}/gtk-2.0/gtkrc
export I3SOCK=${XDG_RUNTIME_DIR}/i3/socket
#export BSPWM_SOCKET=${XDG_RUNTIME_DIR}/bspwm/socket
export BSPWMRC="${XDG_CONFIG_HOME}/bspwm/bspwmrc"
export BSPWM_STATE=${XDG_CACHE_HOME}/bspwm/state.json
export BSPWM_FIFO=${XDG_CACHE_HOME}/bspwm/wm_state
export SXHKD_SHELL=/bin/sh
export RXVT_SOCKET=${XDG_RUNTIME_DIR}/urxvtd
export SSH_ASKPASS=x11-ssh-askpass
export TMUX_TMPDIR=${XDG_RUNTIME_DIR}
export GPG_TTY=$(tty)
export SSH_AGENT_PID=
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export WEECHAT_HOME=${XDG_CONFIG_HOME}/weechat
export WEGORC=${XDG_CONFIG_HOME}/wegorc
gpg-connect-agent RELOADAGENT /bye &>/dev/null

case "${SHELL##*/}" in
    bash) . ~/.bashrc ;;
#    zsh)  . ~/.zshrc  ;;
esac
