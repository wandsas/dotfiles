#!/bin/sh

cd ~
curl -OL https://download.jetbrains.com/idea/ideaIC-2021.1.2.tar.gz
echo 'e2517d79b39581f1548ca4119cb2fa478505cf73203d97b4f3292f05ae71250e *ideaIC-2021.1.2.tar.gz' |
    sha256sum
tar xvf ideaIC-2021.1.2.tar.gz
rm ideaIC-2021.1.2.tar.gz
mv idea-IC-211.7442.40 idea