#!/bin/bash


[ -d ~/chromium ] || mkdir -p ~/chromium && cd ~/chromium
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$HOME/chromium/depot_tools:$PATH

fetch --nohooks android
cd src
echo "target_os = [ 'android' ]" >> ../.gclient
gclient sync
build/install-build-deps-android.sh
gclient runhooks
gn args out/Default


# get other build targets gn ls out/Default
# //chrome/test:unit_tests use autoninja -C out/Default chrome/test:unit_tests
autoninja -C out/Default chrome_public_apk


git clone https://github.com/GrapheneOS/Vanadium.git vanadium
cd vanadium

