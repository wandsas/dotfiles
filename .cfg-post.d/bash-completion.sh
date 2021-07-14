#!/bin/sh

[ -d ~/.config/bash_completion.d ] || mkdir -p ~/.config/bash_completion.d

# Install tmux bash-completion, if it is not installed
if [ ! -f ~/.config/bash_completion.d/tmux.sh ]; then
    curl -fLo ~/.config/bash_completion.d/tmux.sh --create-dirs \
        https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux
    info "Added tmux bash completion support."
fi

# Install zfs bash-completion, if it is not installed
if [ ! -f ~/.config/bash_completion.d/zfs.sh ]; then
    if [ ! -d ~/.GIT/zfs/zfs ]; then
        [ -d ~/.GIT/zfs ] || install -m 755 ~/.GIT/zfs
        cd .GIT/zfs
        git clone git://github.com/openzfs/zfs.git
        cd zfs
        ./autogen.sh
        ./configure
        make
    fi  
    cp ~/.GIT/zfs/zfs/contrib/bash_completion.d/zfs \
        ~/.GIT/wandsas/dotfiles/.config/bash_completion.d/zfs.sh
    info "Added zfs bash completion support."
fi

# Install lxd bash-completion, because completion fails due to a bug in the script
if [ ! -f ~/.config/bash_completion.d/lxd.sh ]; then
  local dir=/usr/share/bash-completion/completions
  cp $dir/lxc ~/.config/bash_completion/lxc.sh
  cp $dir/lxd ~/.config/bash_completion/lxd.sh
fi
