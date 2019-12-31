#!/usr/bin/env sh

#
# get json value by key
#
function get_value {
  echo "$1" | jq ".$2"
}

# vim:ft=sh:fenc=utf-8:
