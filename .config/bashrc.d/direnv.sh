#!/bin/sh

# Load/unload environment variables
if command -v direnv; then
  eval $(direnv hook bash)
fi

