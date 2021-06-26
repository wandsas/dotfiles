#!/bin/sh

export ANDROID_HOME=$HOME/android/sdk

sudo apt-get update
sudo apt-get install openjdk-17-jdk curl unzip

# cmdline-tools
[ -d $ANDROID_HOME/cmdline-tools ] || mkdir -p $ANDROID_HOME/cmdline-tools
cd $ANDROID_HOME/cmdline-tools
curl -O https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
echo '7a00faadc0864f78edd8f4908a629a46d622375cbe2e5814e82934aebecdb622 commandlinetools-7302050_latest.zip' | sha256sum -c
unzip commandlinetools-linux-7302050_latest.zip
rm commandlinetools-linux-7302050_latest.zip
mv tools latest
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
sdkmanager 'cmdline-tools;latest'
# platform-tools
sdkmanager platform-tools
export PATH=$ANDROID_HOME/platform-tools:$PATH
# build-tools
sdkmanager 'build-tools;30.0.2'
export PATH=$HOME/android/sdk/build-tools/30.0.2:$PATH
# ndk-bundle
sdkmanager ndk-bundle
export PATH=$ANDROID_HOME/ndk-bundle:$PATH

sdkmanager --update
