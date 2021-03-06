#!/usr/bin/env sh

is_darwin () {
    [[ `uname -s` == Darwin ]]
}

is_linux () {
	[[ `uname -s` == Linux ]]
}

is_freebsd () {
	[[ `uname -s` == FreeBSD ]]
}

is_openbsd () {
	[[ `uname -s` == OpenBSD ]]
}

is_debian () {
	[[ -f /etc/debian_release ]]
}

is_gentoo () {
	[[ -f /etc/gentoo_release ]]
}

is_alpine () {
    [[ -f /etc/alpine-release ]]
}

is_void () {
    [[ -f /etc/void-release ]]
}

# vim:ft=sh:fenc=utf-8:
