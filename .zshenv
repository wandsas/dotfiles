# ~/.zshenv

# This gets run even for non-interactive shells, so keep it as fast as possible.

export ZDOTDIR=${ZDOTDIR:-$HOME}


# Stop bad system-wide scripts interfering.
setopt NO_global_rcs

setopt extended_glob


if [ -r "$HOME/.profile" ]; then
    source ~/.profile
fi

# 077 would be more secure, but 022 is generally quite realistic
umask 022


# Path
typeset -U PATH path
export PATH

path=(
    $ZDOTDIR/{.local/,.go/,.cargo/,.npm-global/,.cask/,}bin
    /usr/local/{bin,sbin}
    $path
    )

# Manpath
typeset -U manpath
export MANPATH

# Infopath
typeset -U infopath
export INFOPATH


# Libraries

# LD_LIBRARY_PATH
typeset -TU LD_LIBRARY_PATH ld_library_path

# Perl libraries
typeset -TU PERL5LIB perl5lib

# GOPATH
export GOPATH=$HOME/.go

# Python libraries
typeset -TU PYTHONPATH pythonpath
export PYTHONPATH

# Ruby libraries
typeset -TU RUBYLIB rubylib
export RUBYLIB

# Node.js
export npm_config_prefix=$HOME/.npm-global
export NODE_PATH=$npm_config_prefix/lib/node_modules


# Fpath
fpath=(
    $ZDOTDIR/.[z]sh/{$ZSH_VERSION/*.zwc,functions}(N)
    $fpath
    )

for dirname in $fpath; do
    case "$dirname" in
	($ZDOTDIR/.zsh*) fns=( $dirname/*~*~(-N.x:t) ) ;;
	              *) fns=( $dirname/*~*~(-N.:t ) ) ;;
    esac
    (( $#fns )) && autoload "$fns[@]"
done
