# ~/.config/profile.d/gpg-agent.sh

# Sets the current teletypewriter (TTY).
set_current_tty () {
    GPG_TTY=$(tty)
    export GPG_TTY
}

init-gpg-agent () {
    set_current_tty
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1
}
init_gpg_agent

update-gpg-agent () {
    set_current_tty
    echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1
}
update-gpg-agent
