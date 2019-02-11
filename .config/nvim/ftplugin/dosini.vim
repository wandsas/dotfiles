"
" Enables syntax folding for the configuration file.
" Removes the need to clutter the file with fold markers.
"
" Put the file in $VIM/after/syntax/dosini.vim
"
syn region dosiniSection start="^\[" end="\(\n\+\[\)\@=" contains=dosiniLabel,dosiniHeader,dosiniComment keepend fold
setlocal foldmethod=syntax

" Uncomment to start with folds open
"setlocal foldlevel=20

set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
