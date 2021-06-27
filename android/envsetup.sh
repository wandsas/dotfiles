if [ -d $HOME/android ]; then
    export ANDROID_HOME=$HOME/android/sdk
    export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
    export PATH=$ANDROID_HOME/platform-tools:$PATH
    export PATH=$ANDROID_HOME/build-tools/30.0.2:$PATH
    export PATH=$ANDROID_HOME/ndk-bundle:$PATH
fi

if [ -d $HOME/chromium ]; then
    export PATH=$HOME/chromium/depot_tools:$PATH
fi

if [ -d $HOME/idea ]; then
    export PATH=$HOME/idea/bin:$PATH
fi
