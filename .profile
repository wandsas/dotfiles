# .profile

## POSIX variables
# http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03
export LANG=en_US.UTF-8
export LC_COLLATE=C
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export PATH=${PATH:-/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin}
export MANPATH=${MANPATH:-$HOME/.local/share/man:/usr/local/share/man:/usr/share/man}
export INFOPATH=${INFOPATH:-$HOME/.local/share/info:/usr/local/share/info:/usr/share/info}

## XDG path variables
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/run/user/$(id -u)}

## XDG system path variable
# https://standards.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html.
export XDG_DATA_DIRS="${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

## Runit user service
export SVDIR=$HOME/service
export ETCSVDIR=$HOME/sv

# C/C++
export MAKEOPTS='^-j$(($(getconf _NPROCESSORS_ONLN)+1)) --no-print-directory'
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:range1=32:range2=34:locus=01:quote=01:path=01;36:fixit-insert=32:fixit-delete=31:diff-filename=01:diff-hunk=32:diff-delete=31:diff-insert=32:type-diff=01;32"

# Perl
export PERL5LIB=${HOME}/.local/lib/perl5${PERL5LIB:+:${PERL5LIB}};

# Go
export GOPATH=$HOME/.local/lib/go

# Java
export JAVA_HOME=/usr/lib/jvm/openjdk11
export JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true -XX:-UsePerfData'

# pyenv
export PYENV_ROOT=$HOME/.local/lib/pyenv
eval "$($PYENV_ROOT/bin/pyenv init --path)"

# rbenv
export RBENV_ROOT=$HOME/.local/lib/rbenv
eval "$($RBENV_ROOT/bin/rbenv init - bash)"
# NVM
export NVM_DIR=$HOME/.local/lib/nvm
[ -s $NVM_DIR/nvm.sh ] && \. "$NVM_DIR/nvm.sh
[ -s $NVM_DIR/bash_completion ] && \. "$NVM_DIR/bash_completion

export LESS="-a -h100 -i -j15 -M -q -R -W -y100 -X"
export LESSOPEN='|lesspipe %s'
export LESSHISTFILE=$XDG_CACHE_HOME/less_history
export LESSKEY=$XDG_CACHE_HOME/less.key
export TMUX_TMPDIR=$XDG_RUNTIME_DIR
export RXVT_SOCKET=$XDG_RUNTIME_DIR/urxvtd
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export GIMP2_DIRECTORY=$XDG_CONFIG_HOME/gimp
export SSH_ASKPASS=gnome-ssh-askpass
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgreprc

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
prependpath ${RBENV_ROOT}/bin
prependpath ${PYENV_ROOT}/bin
prependpath ${PERL5LIB}/bin
prependpath ${GOPATH}/bin
prependpath ${HOME}/.cargo/bin
prependpath ${HOME}/.local/bin
prependpath ${HOME}/bin
unset prependpath
export PATH

# Load local user profiles settings, if available.
if [ -d $XDG_CONFIG_HOME/profile.d ]; then
  for sh in $XDG_CONFIG_HOME/profile.d/*.sh; do
    [ -r "$sh" ] && . "$sh"
  done
  unset sh
fi

# We want to source ~/.bashrc
[ -f ~/.bashrc ] && . ~/.bashrc
