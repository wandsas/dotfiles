#!/bin/sh

if command -v lesskey &>/dev/null; then
  lesskey -o ${LESSKEY:-~/.cache/less.key}
fi
