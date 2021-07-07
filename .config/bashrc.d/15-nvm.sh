# ~/.config/bashrc.d/15-nvm.sh

if [ -d ~/.local/lib/nvm ]; then
    export NVM_DIR=$HOME/.local/lib/nvm
    [ -s $NVM_DIR/nvm.sh ] && . $NVM_DIR/nvm.sh
    [ -s $NVM_DIR/bash_completion ] && . $NVM_DIR/bash_completion
fi
