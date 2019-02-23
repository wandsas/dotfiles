
install-zplugin () {
    local ZPLG_HOME=${ZDOTDIR:-$HOME}/.zplugin

    if ! test -d "$ZPLG_HOME"; then
        mkdir "$ZPLG_HOME"
        chmod g-rwX "$ZPLG_HOME"
    fi
    echo ">>> Downloading zplugin to $ZPLG_HOME/bin"
    if test -d "$ZPLG_HOME/bin/.git"; then
        cd "$ZPLG_HOME/bin"
        git pull origin master
    else
        cd "$ZPLG_HOME"
        git clone --depth 10 https://github.com/zdharma/zplugin.git bin
    fi
    echo ">>> Done"
}

[[ -d ~/.zplugin ]] || install-zplugin


### Added by Zplugin's installer
source ${HOME}/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### Added by Zplugin's installer

# zsh-completions
#zplugin creinstall /usr/share/zsh/site-functions

# fzf
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin

# zsh-morpho
zplugin load psprint/zsh-morpho
# Screensaver: zmorpho | zmandelbrot | zblank | pmorpho | cmatrix
zstyle ":morpho" screen-saver "zmandelbrot"
zstyle ":morpho" arguments "-s"
zstyle ":morpho" delay "290"
zstyle ":morpho" check-interval "60"

# zsh-diff-so-fancy
zplugin light zdharma/zsh-diff-so-fancy

# zsh-history-substring-search
zplugin light zsh-users/zsh-history-substring-search

# zsh-autosuggestions
zplugin light zsh-users/zsh-autosuggestions

# fast-syntax-highlighting
zplugin light zdharma/fast-syntax-highlighting
