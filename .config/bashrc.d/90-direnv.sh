# 90-direnv.sh

if type -p direnv >/dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi
