# 50-gpg-agent.sh

if [ -z $SSH_AUTH_SOCK ]; then
  export SSH_AUTH_SOCK=/run/user/$(id -i)/gnupg/S.gpg-agent.ssh
fi
export GPG_TTY=$(tty)
echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1
