#!/bin/bash

# dotfiles/.cfg-post.d

. ${HOME}/lib/stdout-log.sh

# Prepare xdg dirs for first user login.
for xdgvar in ~/.config ~/.cache ~/.local/share; do
    info "Testing $xdgvar."

    if [ -d $XDG ]; then
        msg "Dir: $xdgvar exists. Doing nothing."
    else
        msg "Create dir: $xdgvar."
        mkdir -p $xdgvar
    fi
done

# Try to keep the environmenet pollution down, EPA loves us
unset red yellow bold reset
