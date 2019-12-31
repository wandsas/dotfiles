#!/usr/bin/env bash

set -e

workdir="${HOME}/.config/erunit"
services_available="${workdir}/services/available"
services_enabled="${workdir}/services/enabled"

export SVDIR="${services_enabled}"

is_runsvdir_process () {
    if ! [ -d "/proc/$1" ]; then
        return 1
    fi

    if ! [ "$(< "/proc/$1/comm")" = 'runsvdir' ]; then
        return 1
    fi

    return 0
}

runit_runsvdir_start () {
    local pid

    if [ -f "${workdir}/runsvdir.pid" ]; then
        pid="$(< "${workdir}/runsvdir.pid")"

        if is_it_runsvdir_process "${pid}"; then
            echo "runsvdir is already running as ${pid}"
            exit 0
        fi
    fi

    runsvdir -P "${SVDIR}" >/dev/null 2>&1 &
    pid="$!"
    echo "${pid}" >"${workdir}/runsvdir.pid"
    echo "runsvdir started, pid ${pid}".
}

runit_runsvdir_stop () {
    local pid

    if ! [ -f "${workdir}/runsvdir.pid" ]; then
        echo 'runsvdir is not running.'
        exit 1
    fi

    pid="$(< "${workdir}/runsvdir.pid")"

    if ! is_it_runsvdir_process "${pid}"; then
        echo 'runsvdir is not running.'
        exit 1
    fi

    cd "${SVDIR}"
    sv -w 120 force-stop ./* || true
    sv exit ./* || true
    kill "${pid}"
    rm -f "${workdir}/runsvdir.pid"
    echo 'Stopped.'
}

runit_list () {
    cd "${services_available}"
    for i in ./*; do
        test -e "$i" || continue
        name="${i#./}"
        if [ -e "${services_enabled}/${name}" ]; then
            flag='ENABLED'
        else
            flag=''
        fi

        printf '%-7s   %s\n' "${flag}" "${name}"
    done
}

runit_status () {
    cd "${SVDIR}"
    if [ "$1" ]; then
        sv status "$1"
    else
        for i in ./*; do
            test -e "$i" || continue
            sv status "$i" | sed 's%\./%%g'
        done
    fi
}

runit_sv_passthru () {
    cd "${SVDIR}"
    sv "$1" "$2"
}

runit_new () {
    cd "${services_available}"

    if [ -d "$1" ]; then
        echo "Service '$1' already exist."
        exit 1
    fi

    mkdir -p "$1/log"

    cat >"$1/run" <<EOF
#!/bin/sh

exec 2>&1

exec $2
EOF

    cat >"$1/log/run" <<EOF
#!/bin/sh

exec 2>&1

exec svlogd -tt .
EOF

    cat > "$1/log/config" <<EOF
s8388608
n8
t604800
EOF

    chmod +x "$1/run" "$1/log/run"
    touch "$1/log/.borg-exclude-dir"

    echo "The ${workdir}/services/available/$1 has been created."
}

runit_enable () {
    ln -s "${services_available}/$1" "${services_enabled}/$1"
}

runit_disable () {
    rm "${services_enabled}/$1"
}

runit_init () {
    mkdir -v -p \
        "${services_available}" \
        "${services_enabled}"
}

runit_log () {
    tail -n 256 -f "${services_available}/$1/log/current"
}

case "$1" in
    start|stop|up|down|reload|restart|shutdown|force-stop|force-reload|force-restart|force-shutdown|try-restart)
        runit_sv_passthru "$1" "$2"
    ;;
    enable|disable|list|runsvdir-start|runsvdir-stop|status|new|init|log)
        option="${1//-/_}"
        shift
        runit_"${option}" "$@"
    ;;
    *)
        echo 'Wrong parameter'
        exit 1
    ;;
esac
