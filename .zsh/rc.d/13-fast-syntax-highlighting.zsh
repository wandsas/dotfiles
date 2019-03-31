# Syntax Highlighting for the Z-Shell (https://github.com/zdharma/fast-syntax-highlighting)

zshrc_fast_syntax_highlighting () {
    . ~/.local/lib/fast-syntax-highlighting.zsh NIL || return
    FAST_HIGHLIGHT[use_async]=1
    FAST_HIGHLIGHT[use_brackets]=1
}

if [[ -z "${ZSHRC_SKIP_FAST_SYNTAX_HIGHLIGHTING:++}" ]] && is-at-least 4.3.9
then    zshrc_fast_syntax_highlighting
fi
