#!/bin/bash

# dotfiles/.cfg-post.d


# Ansi colors
yellow="\e[0;93m"
reset="\e[0m"

# Prepare xdg dirs for first user login.
for xdgvar in ~/.config ~/.cache ~/.local/share; do
    printf "${yellow}==>${reset} Testing $xdgvar.\n"

    if [ -d $XDG ]; then
        printf "${yellow}==>${reset} Dir: $xdgvar exists. Doing nothing.\n"
    else
        printf "${yellow}==>${reset} Create dir: $xdgvar.\n"
        mkdir -p $xdgvar
    fi
done

# Try to keep the environmenet pollution down, EPA loves us
unset red yellow bold reset
