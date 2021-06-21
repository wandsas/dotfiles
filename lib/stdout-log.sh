#!/bin/sh

msg_ok() {
  # bold/green
  printf "\033[1m\033[32m OK\033[m\n"
}

msg() {
  # bold
  printf "\033[1m=> $@\033[m\n"
}

info () {
  # bold/green
  printf "\033[0m\033[32mINFO: \033[m $@\n"
}

warn () {
  # bold/yellow
  printf "\033[1m\033[33mWARNING:\033[m $@\n"
}

error () {
  # bold/red
  printf "\033[1m\033[31mERROR:\033[m $@\n"
}

die () {
  local ret=$?
  error "$@"
  exit $ret
}

spacer () {
  printf "\n"
  printf "\n"
  printf "\n"
}

underline () {
  printf "###############################################################################\n"
  printf "\n"
}
