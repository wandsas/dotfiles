#!/bin/sh

. colors.sh
. date.sh
. stdout-log.sh

LOG_FILE="${1:-$HOME/file-logger-$(print_timestamp).log}"

fatal ()
{
    error "$@"
}

# Broken out as special case for log() failure.  Ordinarily you
# should just use error() to terminate.
_die () {
    echo "ERROR: $@" >&2
    exit 1
}

error () {
    log "ERROR: $@"
    _die "$@"
}

warn () {
    log "WARNING: $@"
    echo "WARNING: $@" >&2
}

log () {
    if [ -z "$LOGFILE" ]; then
        #_die "\$LOGFILE was not set - aborting"
        return
    fi
    info "$*"
    echo "$*" >> "$LOGFILE" || _die "Can't append to $LOGFILE - aborting"
}
