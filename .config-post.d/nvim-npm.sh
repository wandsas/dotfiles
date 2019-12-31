#!/bin/bash

for pkg in devicons octicons prettier prettify
do
    npm install -g $pkg
done

unset pkg
