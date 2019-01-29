#!/bin/sh

main () {
    local config=~/.config/polybar/config
    killall -q polybar &>/dev/null
    while pgrep -u $UID -x polybar &>/dev/null; do sleep 1; done

    install -d ~/.cache/polybar
    polybar top    -c "$config" -r 2> ~/.cache/polybar/stderr &
    polybar bottom -c "$config" -r 2> ~/.cache/polybar/stderr &
}

main "$@"
