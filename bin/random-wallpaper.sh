#!/bin/bash

random_wallpaper () {
    local files=($HOME/.wallpapers/*)

    WALLPAPER=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
    WALLPAPER2=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")

    feh -B white --bg-fill $WALLPAPER --bg-fill $WALLPAPER2
}

if [[ "$#" = 1 ]]; then
    feh -B white --bg-fill "$1"
else
    random_wallpaper
fi

# vim:fenc=utf-8:ft=sh
