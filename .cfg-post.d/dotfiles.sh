#!/bin/bash

# Install pre requirements for user environment setup

# ansi colors
red="\e[0;91m"
yellow="\e[0;93m"
bold="\e[1m"
reset="\e[0m"

XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_LOCAL=$HOME/.local/share

# Prepare XDG dirs for first user login
for XDG in $XDG_CONFIG_HOME $XDG_CACHE_HOME $XDG_DATA_HOME; do
    printf "${yellow}==>${reset} Preparing XDG_CONFIG_HOME=$XDG_CONFIG_HOME\n"
    if [ -d $XDG ]; then
        printf "${yellow}==>${reset} Directory: $XDG still exists. Doing nothing.\n"
    else
        printf "${yellow}==>${reset} Creating directory $XDG.\n"
        mkdir -p $XDG
    fi
done


unset XDG_CONFIG XDG_CACHE_HOME XDG_DATA_HOME
