# 10-zplugin.zsh

_install-zplugin () {
    ZPLG_HOME="${ZDOTDIR:-$HOME}/.zplugin"

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

[ -d ~/.zplugin ] || _install-zplugin


### Added by Zplugin's installer
source '/home/wandsas/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

### httpstat ###
zplugin ice mv"httpstat.sh -> httpstat" pick"httpstat" as"program"
zplugin snippet https://github.com/b4b4r07/httpstat/blob/master/httpstat.sh
### End of httpstat

### fzf ###
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin
### End of fzf ###

### git-extras ###
zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zplugin light tj/git-extras
### End of git-extras

### zconvey ###
zplugin ice wait"0"
zplugin light zdharma/zconvey
zplugin ice wait"0" as"command" pick"cmds/zc-bg-notify" silent
zplugin light zdharma/zconvey
# Interval [sec] to check for new command
zstyle ":plugin:zconvey" check_interval "2"
# If shell is busy for 22 seconds, received command will expire and not run
zstyle ":plugin:zconvey" expire_seconds "22"
# Display at zsh start: logo | text | none
zstyle ":plugin:zconvey" greeting "none"
zstyle ":plugin:zconvey" ask "0"
zstyle ":plugin:zconvey" use_zsystem_flock "1"
zstyle ":plugin:zconvey" output_method "feeder"
zstyle ":plugin:zconvey" timestamp_from "datetime"
### End of zconvey ###

### zsh-morpho ###
zplugin load psprint/zsh-morpho
# Screensaver: zmorpho | zmandelbrot | zblank | pmorpho | cmatrix
zstyle ":morpho" screen-saver "zmandelbrot"
zstyle ":morpho" arguments "-s"
zstyle ":morpho" delay "290"
zstyle ":morpho" check-interval "60"
### End of zsh-morpho ###

### zsh-diff-so-fancy ###
zplugin light zdharma/zsh-diff-so-fancy
### End of zsh-diff-so-fancy ###

### zsh-autosuggestions ###
zplugin light zsh-users/zsh-autosuggestions
### End of zsh autosuggestions

### zsh-history-substring-search ###
zplugin light zsh-users/zsh-history-substring-search
### End of zsh-history-substring-search ###

### fast-syntax-highlighting ###
zplugin light zdharma/fast-syntax-highlighting
### End of fast-syntax-highlighting ###

### zsh-completions & gentoo-zsh-completions ###
# zplugin creinstall /usr/share/zsh/site-functions
### End of zsh-completions & gentoo-zsh-completions ###

unfunction _install-zplugin
