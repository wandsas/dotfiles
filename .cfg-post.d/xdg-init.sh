#!/bin/bash

# dotfiles/.cfg-post.d


# Ansi colors
red="\e[0;91m"
yellow="\e[0;93m"
green="\e[0;92m"
bold="\e[1m"
reset="\e[0m"

XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_LOCAL=$HOME/.local/share

# Prepare XDG dirs for first user login
for XDG in $XDG_CONFIG_HOME $XDG_CACHE_HOME $XDG_DATA_HOME; do
    echo "xdg $XDG"
done
  
printf "${yellow}==>${reset} XDG_CONFIG_HOME=$XDG_CONFIG_HOME\n"
    if [ -d $XDG ]; then
        printf "${yellow}==>${reset} Directory: $XDG still exists. Doing nothing.\n"
    else
        printf "${yellow}==>${reset} Creating directory $XDG.\n"
        mkdir -p $XDG
    fi
done

# Try to keep the environmenet pollution down, EPA loves us
unset red yellow bold reset XDG_CONFIG XDG_CACHE_HOME XDG_DATA_HOME
