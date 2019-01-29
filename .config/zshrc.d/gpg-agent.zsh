# Init gpg-agent with ssh-support

(( $+commands[gpg-agent] )) && {
    export GPG_TTY=$(tty)
    unset SSH_AGENT_PID
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
        export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    fi
    gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1

    function _gpg-agent-update-tty {
        gpg-connect-agent reloadagent /bye >/dev/null 2>&1
    }
    autoload -Uz add-zsh-hook
    add-zsh-hook preexec _gpg-agent-update-tty
}
