# .profile

# POSIX variables
# http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03
export LANG=en_US.UTF-8
export LC_COLLATE=C
export EDITOR=vim
export PAGER=less
export MANPATH="/usr/local/share/man:/usr/share/man"

# XDG path variables
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/run/user/$(id -u)}

# XDG system path variable
# https://standards.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html.
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}

# Runit user service supervision
export SVDIR=$HOME/service

export LESS="-R -M"
export LESSOPEN="|lesspipe %s"
export LESSHISTFILE=${XDG_CACHE_HOME}/less_history

export MPD_HOST=${XDG_RUNTIME_DIR}/mpd
#export RXVT_SOCKET=${XDG_RUNTIME_DIR}/urxvtd
export TMUX_TMPDIR=${XDG_RUNTIME_DIR}

export SSH_ASKPASS=gnome-ssh-askpass
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export GTK2_RC_FILES=${XDG_CONFIG_HOME}/gtk-2.0/gtkrc
export GIMP2_DIRECTORY=${XDG_CONFIG_HOME}/gimp
export RIPGREP_CONFIG_PATH=${XDG_CONFIG_HOME}/ripgreprc

# void-x86_64-linux-gnu chroot
export VOIDNSRUN_DIR=${HOME}/void-glibc
export VOIDNSUNDO_BIN=/usr/local/bin/voidnsrun

export MAKEOPTS='^-j$(($(getconf _NPROCESSORS_ONLN)+1)) --no-print-directory'
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:range1=32:range2=34:locus=01:quote=01:path=01;36:fixit-insert=32:fixit-delete=31:diff-filename=01:diff-hunk=32:diff-delete=31:diff-insert=32:type-diff=01;32"
# Python
export PYTHONPATH="${HOME}/.local/lib/python3.9/site-packages/"
# Perl
export PERL5LIB="${HOME}/.local/lib/perl5/lib/perl5"
# Rust/Cargo
export CARGO_HOME=${HOME}/.local/lib/cargo
# Golang
export GOPATH=${HOME}/.local/lib/go
export GOBIN=${HOME}/.local/bin
# OpenJDK
export JAVA_HOME=/usr/lib/jvm/openjdk11
export JAVA_OPTIONS="-XX:-UsePerfData ${JAVA_OPTIONS}"
# pyenv
if [ -d ~/.local/lib/pyenv ]; then
    export PYENV_ROOT=${HOME}/.local/lib/pyenv
    eval "$(${PYENV_ROOT}/bin/pyenv init --path)"
    eval "$(${PYENV_ROOT}/bin/pyenv virtualenv-init -)"
fi
# rbenv
if [ -d ~/.local/lib/rbenv ]; then
    export RBENV_ROOT=$HOME/.local/lib/rbenv
    eval "$($RBENV_ROOT/bin/rbenv init - bash)"
fi

# Build a custom user path
prependpath () {
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

PATH=
prependpath /opt/texlive/2021/bin/x86_64-linuxmusl
prependpath /sbin
prependpath /bin
prependpath /usr/sbin
prependpath /usr/bin
prependpath /usr/local/sbin
prependpath /usr/local/bin
prependpath ${RBENV_ROOT}/bin
prependpath ${PYENV_ROOT}/bin
prependpath ${HOME}/.local/lib/perl5/bin
prependpath ${HOME}/.local/lib/perl5/lib/perl5
prependpath ${CARGO_HOME}/bin
prependpath ${GOBIN}
prependpath ${HOME}/bin
unset prependpath
export PATH

# If running bash, we also want to source ~/.bashrc
[ $BASH_VERSION ] && [ -f ~/.bashrc ] && . ~/.bashrc
