#!/bin/sh

# Check for root-permissions
is_uid_root () {
  if [ `id -u` != 0 ]; then
    echo "Not root; aborting." >&2
    exit 1
  fi
}


# Check if user is not root
is_uid_non_root () {
  if [ `id -u` = 0 ]; then
    echo "Must not be root; aborting." >&2
    exit 1
  fi
}
