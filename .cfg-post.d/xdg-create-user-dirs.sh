#!/bin/bash

# dotfiles/.cfg-post.d


# Ansi colors
red="\e[0;91m"
yellow="\e[0;93m"
green="\e[0;92m"
bold="\e[1m"
reset="\e[0m"

xdgvars=(
    "XDG_CONFIG_HOME: $HOME/.config"
    "XDG_CACHE_HOME: $HOME/.cache"
    "XDG_DATA_HOME: $HOME/.local/share"
)

echo ${xdg_vars[*]}
echo ${xdg_vars[0]}
echo ${xdg_vars[1]}
echo ${xdg_vars[2]}

# Prepare xdg dirs for first user login.
for xdg_var in ${xdg_vars[@]}; do
    echo "xdg $xdg_var"
done
  
printf "${yellow}==>${reset} \n"
if [ -d $XDG ]; then
    printf "${yellow}==>${reset} Dir: $xdg_var still exists. Doing nothing.\n"
else
    printf "${yellow}==>${reset} Created dir: $xdg_var.\n"
    mkdir -p $xdg_var
fi

# Try to keep the environmenet pollution down, EPA loves us
unset red yellow bold reset XDG_CONFIG XDG_CACHE_HOME XDG_DATA_HOME
