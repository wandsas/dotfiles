#!/bin/bash
# Name: verify-digests.sh
# Title: Gentoo Linux release digest verification
# Author: Robin H Johnson <robbat2@gentoo.org>
# Copyright 2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#
# Description:
# This script exists to help mirrors verify raw digests of release files, to
# detect possible disk and filesystem corruptions.  By design, it does NOT check
# GPG signatures.
#
# Usage:
# verify-digests.sh [FILES-OR-DIRECTORIES...]
#
# If passed a digest file:
# - it will be checked.
# If passed a non-digest file:
# - that immediate directory will be checked for all digest files.
# If passed a directory:
# - it and all subdirs will be checked for all digest files.
# If passed no arguments:
# - it will act like the directory '.' was passed.
#
# Return value:
# On success, exits zero.
# On failures, exits non-zero, and writes a file of errors to $TMPDIR.


# Take Gentoo digest files and convert to a plain BSD-format digest file.
# - strip any PGP signing
# - pass existing BSD-format digest
# - convert coreutils-format to BSD-format
transform_digest() {
	sed -n -r \
		-e '/BEGIN (PGP|GPG) SIGNED MESSAGE/,/^$/d' \
		-e '/BEGIN (PGP|GPG) SIGNATURE/,/END (PGP|GPG) SIGNATURE/{d}' \
		-e 'p' \
	| \
	awk \
		-e '/^# .* HASH$/{hash=$2}' \
		-e '/^[[:xdigit:]]+[[:space:]]+.+/{if(hash != ""){printf "%s (%s) = %s\n",hash,$2,$1}}' \
		-e '/^((SHA|MD|RIPEMD)[0-9]+|WHIRLPOOL) \(.*\) = [[:xdigit:]]+/{print $0}' \
		-e '/^((SHA|MD|RIPEMD)[0-9]+|WHIRLPOOL) [[:xdigit:]]+ [^[:space:]]+$/{ printf "%s (%s) = %s\n",$1,$3,$2; }'
}

# Pass all directory arguments to find
# Keep all file arguments as-is (so you can pass .asc files directly)
DIGESTS_ARGS=( )
DIGESTS_FIND=( )
if [[ ${#@} -eq 0 ]]; then
	DIGESTS_FIND+=( . )
else
	for f in "${@}" ; do
		if [ -d "$f" ]; then
			DIGESTS_FIND+=( "$f" )
		else
			DIGESTS_ARGS+=( "$f" )
		fi
	done
fi

# Check if non-dir arguments were digest files or files that you want to get checked
DIGESTS_ARGS2=( )
for f in "${DIGESTS_ARGS[@]}" ; do
	if [[ "${f/DIGEST}" != "$f" ]] || grep -sq -m 1 -e '# MD5 HASH' -e '# SHA[0-9]\+ HASH' -e ') = [0-9a-f]\+' $f; then
		DIGESTS_ARGS2+=( "$f" )
	else
		d=$( dirname "$f" )
		DIGESTS_FIND2=( )
		readarray -t DIGESTS_FIND2 <<< "$(find "$d" -maxdepth 1  ! -type d \( -name '*.DIGESTS' -o -name '*.DIGESTS.asc' \) | fmt -1 |sort | uniq)"
		DIGESTS_ARGS2+=( "${DIGESTS_FIND2[@]}" )
		DIGESTS_FIND2=( )
	fi
done
if [[ "${#DIGESTS_FIND[@]}" -gt 0 ]]; then
	readarray -t DIGESTS_FIND <<< "$(find "${DIGESTS_FIND[@]}" ! -type d \( -name '*.DIGESTS' -o -name '*.DIGESTS.asc' \) | fmt -1 | sort | uniq )"
fi
# merge all items
DIGESTS=( "${DIGESTS_ARGS2[@]}" "${DIGESTS_FIND[@]}" )


# Prefer signed digests where possible, but sometimes they were in the original
# .DIGESTS file, and other times there was a seperate .asc file.
DIGESTS2="$(echo "${DIGESTS[@]}" | fmt -1 |sed '/.asc$/s/.asc$//' | sort | uniq)"
DIGESTS=( )
for d in ${DIGESTS2} ; do
	if [ -e "${d}" -a -e "${d}.asc" ]; then
		DIGESTS+=( "${d}.asc" )
	elif [ ! -e "${d}" -a -e "${d}.asc" ]; then
		DIGESTS+=( "${d}.asc" )
	elif [ -e "${d}" -a ! -e "${d}.asc" ]; then
		DIGESTS+=( "${d}" )
	fi
done


# Setup storage for digest conversion & results
T=$(date -u +%Y%m%dT%H%M%SZ)
tmp1=$(mktemp --tmpdir)
tmp2=$(mktemp --tmpdir)
failures=$(mktemp --tmpdir gentoo-failures.$T.XXXXXXXXXX)
trap "rm -f $tmp1 $tmp2" SIGINT SIGTERM

# Now check them
failed_digests=()
for d in $(echo "${DIGESTS[@]}" | fmt -1 | sort | uniq); do
  sleep 0.01
  echo -n "Checking digests from $d: "
  transform_digest < "$d" >"$tmp1"
  # add leading & trailing space to match
  hashes=" $(awk '{print $1}' "$tmp1" | sort | uniq ) "
  checked=0
  found=0
  # order by strength
  for h in SHA512 SHA384 SHA256 SHA224 SHA1 MD5 ; do
	  sleep 0.01
	  [[ $found -eq 1 ]] && break
	  if [[ "${hashes/$h}" != "${hashes}" ]]; then
		  found=1
		  echo "using $h"
		  pushd $(dirname $d) >/dev/null
		  cmd=$(echo ${h}sum | tr '[:upper:]' '[:lower:]')
		  grep "^$h " $tmp1 | ionice -c 3 --ignore ${cmd} -c - | tee "$tmp2"
		  rc=${PIPESTATUS[1]}
		  if [ $rc -ne 0 ]; then
			  failed_digests+=("$d")
			  cat "$tmp2" >> "$failures"
		  fi
		  checked=1
		  popd >/dev/null
	  fi
  done
  if [[ $checked -eq 0 ]]; then
	  echo " FAIL - no usable digest"
  fi
done

# Handle output of errors
if [[ "${#failed_digests[@]}" -eq 0 ]]; then
	exit 0
else
	echo "----"
	echo "Failures detected in the following DIGESTS:" 1>&2
	for f in "${failed_digests[@]}"; do
		echo "$f" 1>&2
	done
	echo "----" 1>&2
	echo "Complete output of failed DIGESTS, stored in $failures:" 1>&2
	cat "$failures" 1>&2
	exit 1
fi
