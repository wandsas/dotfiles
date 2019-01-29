#!/bin/bash

pipe=""

trap 'pipe_close' EXIT

# fd=3
# eval "exec $fd<> $fifo"

pipe_open () {
  [ -z "$pipe" ] && {
    pipe=$(mktemp -u);
  }
  [ -p "$pipe" ] || {
    mkfifo "$pipe"
    exec 3<> "$pipe"
  }
}

pipe_close () {
  [ -p "$pipe" ] && {
    rm "$pipe"
    exec 3>&-
  }
}

pipe_push () {
  pipe_open
  echo "$@" >&3
}

pipe_peek () {
  read -r "$1" <&3
}

pipe_tail () {
  while read -r line <&3; do
    if [[ "$line" == "EOF" ]]; then
      break;
    fi
    echo "$line"
  done
}
