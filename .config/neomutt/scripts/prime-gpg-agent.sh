#!/bin/bash

EMAIL_USER=${1:-sascha.wander@gmail.com}

echo "prime" | gpg -e -r $EMAIL_USER > ~/.password-store/mail/prime.gpg

# vim:fenc=utf-8:ft=sh:

