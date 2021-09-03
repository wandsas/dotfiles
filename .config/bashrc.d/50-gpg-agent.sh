# 50-gpg-agent.sh

export GPG_TTY="$(tty)"
export GPG_AGENT_INFO="/run/user/$(id -u)/gnupg/S.gpg-agent"
export SSH_AUTH_SOCK="/run/user/$(id -u)/gnupg/S.gpg-agent.ssh"
echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1
