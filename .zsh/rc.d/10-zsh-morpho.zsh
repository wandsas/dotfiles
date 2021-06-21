# Terminal Screensaver for the Z-Shell (https://github.com/psprint/zsh-morpho)

zshrc_morpho () {
    . ~/.local/lib/zsh-morpho/zsh-morpho.plugin.zsh NIL | return;
    # Screensaver: zmorpho | zmandelbrot | zblank | pmorpho | cmatrix
    zstyle ":morpho" screen-saver "zmandelbrot"
    zstyle ":morpho" arguments "-s"
    zstyle ":morpho" delay "290"
    zstyle ":morpho" check-interval "60"
}

if [[ -z "${ZSHRC_SKIP_MORPHO:++}" ]]
then    zshrc_morpho
fi
