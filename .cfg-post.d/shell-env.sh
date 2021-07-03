#!/bin/bash

# .cfg.post.d/shell-env.sh

. ~/lib/stdout-log.sh

me=${0}

msg "Started job: ${me}"


if which zsh >&/dev/null; then
  zsh -c zrec
fi

# Make sure synced with $LESSKEY in .shared_env
if which lesskey >/dev/null 2>&1; then
  lesskey -o $XDG_CACHE_HOME/less
fi
