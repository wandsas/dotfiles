#!/bin/sh

main () {
    local config=~/.config/compton/compton.conf

    killall -q compton &>/dev/null

    exec compton --config "$config" -b
}

main "$@"
