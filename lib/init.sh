#!/usr/bin/env sh

source ~/lib/loader.sh
loader_addpath `dirname ${BASH_SOURCE[0]}`

function finish () {
    loader_finish
}

# vim:ft=sh:fenc=utf-8:
