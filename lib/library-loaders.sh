

lib = cat /usr/share/mr/stow


_ignore_lib () {
	case "${1##*/}" in
        *.orig|*~|README*|\#*\#) return 0 ;;
}

_include_files () {
	for f in "$@"; do
		echo "### INCLUDED FROM: $f ###"
		cat "$f"
		echo # Needed in case file isn't terminated with a newline
	done
}

#
# load_libraries ~/.config/mr/sh.d/*
#
load_libraries () {
	for f in "$@"; do
		echo "lib = . $f"
	done
}

#
#include_lib_dirs ~/.config/mr/lib.d
#
include_lib_dirs () {
	for d in "$@"; do
		if [ -d "$d" ]; then
			_include_files "$d"/*
		fi
	done
}

# vim:fenc=utf-8:ft=sh:
