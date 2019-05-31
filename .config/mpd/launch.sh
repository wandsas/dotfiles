#!/bin/sh

main () {
    # Mpd already running mpd instances
    mpd --kill >/dev/null 2>&1 &

    # Wait until all processes have been shut down
    while pgrep -u $UID -x mpd &>/dev/null; do sleep 1; done

    mpd >/dev/null 2>&1 &
}

main "$@"
