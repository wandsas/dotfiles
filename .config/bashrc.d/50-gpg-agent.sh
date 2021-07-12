# 50-gpg-agent.sh

export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=/run/user/$(id -i)/gnupg/S.gpg-agent.ssh
echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1
