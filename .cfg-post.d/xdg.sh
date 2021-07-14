#!/bin/sh

me=${0}

msg "Started job: ${me}"

# Prepare xdg dirs for first user login.
for xdg in ~/.config ~/.cache ~/.local/share; do
    msg "Testing $xdg."

    if [ -d $xdg ]; then
        info "Directory: $xdg exists. Abort."
    else
        info "Create directory: $xdg as user: $USER group: $USER mode: 755"
        install -u $USER -g $USER -m 755 -d $xdg
    fi
done

# Try to keep the environmenet pollution down, EPA loves us
unset red yellow bold reset
