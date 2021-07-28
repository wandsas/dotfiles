#!/bin/sh

set -e

if [ -d doc -a \( -d autoload -o -d ftdetect -o -d plugin \) ]; then
  nohup vim -u NONE -c 'helptags doc' -cq >/dev/null 2>&1 </dev/null &
fi

optfiles=`git ls-files -oc --directory -- .ctags '*/.ctags'`

IFS='
'
for optfile in ${optfiles:-./fake}; do
  (
  unset GIT_DIR GIT_WORK_TREE
  tmpfile=`mktemp ${TMPDIR:-/tmp}/tags.XXXXXXXXXX~`
  cd `dirname $optfile`
  trap 'rm -f $tmpfile' EXIT INT TERM
  git ls-files | ctags -L - -f $tmpfile "$@"
  mv $tmpfile tags
  )
done
