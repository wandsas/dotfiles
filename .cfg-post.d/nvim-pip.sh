#!/bin/bash

for pkg in neovim nodeenv pygments python-language-server virtualenv virtualenvwrapper
do
    if command -v "$pkg" >/dev/null; then
        pip install --upgrade --user "$pkg"
    else
        pip install --user "$pkg"
    fi
done

unset pkg
