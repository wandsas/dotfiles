export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export JAVA_OPTIONS="-Xms512m -Xmx1024m"

if [ -d $HOME/android ]; then
    export ANDROID_HOME=$HOME/android/sdk
    export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
    export PATH=$ANDROID_HOME/platform-tools:$PATH
    export PATH=$ANDROID_HOME/build-tools/30.0.3:$PATH
    export PATH=$ANDROID_HOME/ndk-bundle:$PATH
    export PATH=$ANDROID_HOME/emulator:$PATH
fi

if [ -d $HOME/chromium ]; then
    export PATH=$HOME/chromium/depot_tools:$PATH
fi

if [ -d $HOME/android/studio ]; then
    export PATH=$HOME/android/studio/bin:$PATH
fi

if [ -d $HOME/idea ]; then
    export PATH=$HOME/idea/bin:$PATH
fi
