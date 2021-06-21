# ~/.config/bashrc.d/gpg-agent.sh

reload-gpg-agent () {
  export GPG_TTY=$(tty)
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1
}
reload-gpg-agent
