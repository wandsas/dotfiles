#!/bin/sh

source ~/lib/loader.sh

loader_addpath "$(dirname "${BASH_SOURCE[0]}")"

finish () { loader_finish; }

# vim:fenc=utf-8:ft=sh:
