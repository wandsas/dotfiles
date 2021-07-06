#!/bin/bash

# Install the requirements to install android-sdk
sudo apt-get install -y curl libarchive-tools signify-openbsd

# Install the runtime requirements for an Android Development Environment 
sudo apt-get install -y \
	openjdk-17-jdk python3 \ # Install Java, Python
	autoconf automake bison diffutils flex gcc make pkg-config \ # 	development-tools
	libpulse0 libxcb-xinerama0 \ # sound- and graphic-libs
	gpg xzutils zip unzip # encryption/compression cmds and the git vcs.
# Android Python Protobuf
sudo snap install protobuf
sudo pip install

git
# libs
libpulse0 libxcb-xinerama0 ncurses-base ncurses-bin libssl-dev openssl
# compression/encryption:
xzutils gpg zip unzip
# optional user recommendations:
bash-completion vim

