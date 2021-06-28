#!/bin/bash
mkdir -p ~/android/cts/{arm,x86}
cd ~/android/cts/arm
curl -O https://dl.google.com/dl/android/cts/android-cts-11_r4-linux_x86-arm.zip
unzip android-cts-11_r4-linux_x86-arm.zip
rm android-cts-11_r4-linux_x86-arm.zip
curl -O https://dl.google.com/dl/android/cts/android-cts-verifier-11_r4-linux_x86-arm.zip
unzip android-cts-verifier-11_r4-linux_x86-arm.zip
rm android-cts-verifier-11_r4-linux_x86-arm.zip
cd ~/android/cts/x86
curl -O https://dl.google.com/dl/android/cts/android-cts-verifier-11_r4-linux_x86-x86.zip
unzip android-cts-verifier-11_r4-linux_x86-x86.zip
rm android-cts-verifier-11_r4-linux_x86-x86.zip
curl -O https://dl.google.com/dl/android/cts/android-cts-11_r4-linux_x86-x86.zip
unzip android-cts-11_r4-linux_x86-x86.zip
rm android-cts-11_r4-linux_x86-x86.zip
cd ~/android/cts
curl -O https://dl.google.com/dl/android/cts/android-cts-media-1.5.zip
unzip android-cts-media-1.5.zip
rm android-cts-media-1.5.zip
