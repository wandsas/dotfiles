#!/bin/sh

# Load/unload environment variables
if command -v direnv >/dev/null 2>&1; then
  eval $(direnv hook bash)
fi

