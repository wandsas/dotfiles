#!/bin/sh

sudo apt-get update
sudo apt-get install openjdk-17-jdk curl unzip

mkdir -p $HOME/android/sdk/cmdline-tools
cd $HOME/android/sdk/cmdline-tools
curl -O https://dl.google.com/android/repository/commandlinetools-linux-6514223_latest.zip
echo 'ef319a5afdb41822cb1c88d93bc7c23b0af4fc670abca89ff0346ee6688da797 commandlinetools-linux-6514223_latest.zip' | sha256sum -c
unzip commandlinetools-linux-6514223_latest.zip
rm commandlinetools-linux-6514223_latest.zip
mv tools latest

export ANDROID_HOME=$HOME/android/sdk
export PATH=$HOME/android/sdk/cmdline-tools/latest/bin:$PATH

sdkmanager 'cmdline-tools;latest'
sdkmanager platform-tools

export PATH=$HOME/android/sdk/platform-tools:$PATH

sdkmanager 'build-tools;30.0.2'
export PATH=$HOME/android/sdk/build-tools/30.0.2:$PATH

sdkmanager ndk-bundle

export PATH=$HOME/android/sdk/ndk-bundle:$PATH

sdkmanager --update
