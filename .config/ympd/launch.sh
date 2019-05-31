#!/bin/sh

main () {

    killall -q ympd &>/dev/null
    while pgrep -u $UID -x ympd &>/dev/null; do sleep 1; done

    ympd \
        --host 127.0.0.1 \
        --port 6600 \
        --user wandsas \
        --mpdpass hackme \
        --webport 8081 >/dev/null 2>&1 &
}

main "$@"
