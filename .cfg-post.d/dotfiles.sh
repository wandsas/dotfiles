#!/bin/sh

# Install pre requirements for user environment setup

XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_LOCAL=$HOME/.local/share

# Prepare XDG dirs for first user login
for XDG in $XDG_CONFIG_HOME $XDG_CACHE_HOME $XDG_DATA_HOME; do
    printf "==> Preparing XDG_CONFIG_HOME=$XDG_CONFIG_HOME\n"
    if [ -d $XDG ]; then
        printf "==> Directory: $XDG_CONFIG_HOME still exists. Doing nothing.\n"
    else
        printf "==> Creating directory $XDG_CONFIG_HOME.\n"
        mkdir -p $XDG
    fi
done


unset XDG_CONFIG XDG_CACHE_HOME XDG_DATA_HOME
