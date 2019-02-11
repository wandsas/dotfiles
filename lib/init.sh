#!/bin/sh

source ~/lib/loader.sh
loader_addpath `dirname ${BASH_SOURCE[0]}`

function finish () {
    loader_finish
}

# vim:fenc=utf-8:ft=sh:
