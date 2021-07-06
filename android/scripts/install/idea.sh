#!/bin/sh

IDEA_HOME="$HOME/android/idea"

[ -d $HOME/android ] || install -m 755 -d $HOME/android
cd $HOME/android
curl -OL https://download.jetbrains.com/idea/ideaIC-2021.1.2.tar.gz
echo 'e2517d79b39581f1548ca4119cb2fa478505cf73203d97b4f3292f05ae71250e *ideaIC-2021.1.2.tar.gz' | sha256sum
bsdtar xvf ideaIC-2021.1.2.tar.gz
rm ideaIC-2021.1.2.tar.gz
mv idea-IC-211.7442.40 idea

# Add the IntelliJ Idea bin folder to system path, in case you will use the startscript
# on command-line
export $IDEA_HOME=$HOME/android/idea

