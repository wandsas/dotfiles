#!/bin/bash

if [ ! -f $XDG_CONFIG_HOME/bash_completion.d/tmux.sh ]; then
    curl -fLo $XDG_CONFIG_HOME/bash_completion.d/tmux.sh --create-dirs \
        https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux
fi

if [ ! -f $XDG_CONFIG_HOME/bash_completion.d/zfs.sh ]; then
    if [ ! -d ~/.GIT/zfs/zfs ]; then
        [ -d ~/.GIT/zfs ] || install -u $USER -g $USER -g 755 ~/.GIT/zfs
        cd .GIT/zfs
        git clone git://github.com/openzfs/zfs.git
        cd zfs
        ./autogen.sh
        ./configure
        make
    fi  
    cp $HOME/.GIT/zfs/zfs/contrib/bash_completion.d/zfs \
        $HOME/.GIT/wandsas/dotfiles/.config/bash_completion.d/zfs.sh
fi
