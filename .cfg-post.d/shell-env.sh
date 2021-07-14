#!/bin/sh

me=${0}

if [ ${ZSH_VERSION} ]; then
  if which zsh >&/dev/null; then
    zsh -c zrec
  fi
fi

# Make sure synced with $LESSKEY in .profile
if which lesskey >/dev/null 2>&1; then
  lesskey -o $XDG_CACHE_HOME/less.key -- $XDG_CONFIG_HOME/lesskey
fi
