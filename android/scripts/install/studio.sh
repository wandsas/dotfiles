#!/bin/bash

source ../lib/stdout-log.sh

me="$(basename ${0})"

STUDIO_HOME="$HOME/android/studio"

begin "Starting installation of Integrated Development Environment (IDE) IntelliJ IDEA IDE"

if [ -d $HOME/android ]; then
       install -m 755 -d $HOME/android
       msg "Created target path \$HOME/android."
else
	msg "Target path \$HOME/android exists."
fi

info "Check if android-studio is still installed?"
if [ -d $STUDIO_HOME ]; then
    die "Targetdir: \$HOME/android/studio exists. Doing nothing and abort."
else
    info "No existing of android-studio found."
fi

cd $HOME/android
curl -OL https://dl.google.com/dl/android/studio/ide-zips/4.0.1.0/android-studio-ide-193.6626763-linux.tar.gz
echo 'f2f82744e735eae43fa018a77254c398a3bab5371f09973a37483014b73b7597 android-studio-ide-193.6626763-linux.tar.gz' | sha256sum -c
bsdtar xvf android-studio-ide-193.6626763-linux.tar.gz
rm android-studio-ide-193.6626763-linux.tar.gz
mv android-studio studio

cat << EOF > envsetup_idea
echo "export ANDROID_STUDIO_HOME="$HOME/android/studio"
echo "export PATH="$STUDIO_HOME/bin:$PATH"
EOF

end "Successfully installed IDE. ENJOY."
