export JAVA_HOME=${1:-/usr/lib/jvm/java-1.17.0-openjdk-amd64}
export JAVA_OPTIONS="-Xms512m -Xmx1024m $JAVA_OPTIONS"

if [ ! -d $HOME/android ]; then
    export ANDROID_HOME=$HOME/android/sdk
    export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
    export PATH=$ANDROID_HOME/platform-tools:$PATH
    export PATH=$ANDROID_HOME/build-tools/30.0.3:$PATH
    export PATH=$ANDROID_HOME/ndk-bundle:$PATH
    export PATH=$ANDROID_HOME/emulator:$PATH
fi

### Android SDK ###
if [ -d $HOME/chromium ]; then
    export PATH=$HOME/chromium/depot_tools:$PATH
fi

### Android NDK ###
if [ -d $ANDROID_HOME/ndk-bundle ] && [ -d $ANDOID_HOME/../ndk ]; then
    export ANDROID_NDK_HOME=$ANDROID_HOME/../ndk
    

### Android Studio ###
if [ -d $HOME/android/studio ]; then
    export PATH=$HOME/android/studio/bin:$PATH
fi

### IntelliJ Idea ###
if [ -d $HOME/idea ]; then
    export PATH=$HOME/idea/bin:$PATH
fi

cat <<EOF
JAVA_HOME=$JAVA_HOME
JAVA_OPTIONS=$JAVA_OPTIONS
ANDROID_HOME=$ADNDROID_HOME
ANDROID_NDK_HOME=$ANDROID_HOME/../ndk
# Chromium forks
VANADIUM=$HOME/vanadium
BROMITE_HOME=$HOME/bromite
EOF
