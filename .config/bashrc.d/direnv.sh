#!/bin/bash

# Load/unload environment variables
if command -v direnv; then
    eval "$(direnv hook bash)" >/dev/null 2>&1
fi

