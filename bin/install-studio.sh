#!/bin/sh

[ -d ~/android ] || mkdir -p ~/android
cd ~/android
curl -OL https://dl.google.com/dl/android/studio/ide-zips/4.0.1.0/android-studio-ide-193.6626763-linux.tar.gz
echo 'f2f82744e735eae43fa018a77254c398a3bab5371f09973a37483014b73b7597 android-studio-ide-193.6626763-linux.tar.gz' | sha256sum -c
tar xvf android-studio-ide-193.6626763-linux.tar.gz
rm android-studio-ide-193.6626763-linux.tar.gz
mv android-studio studio
export PATH:$PATH:$HOME/android/studio/bin
