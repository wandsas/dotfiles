scriptencoding utf-8

augroup filetypes
    autocmd FileType sh setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType bash setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType zsh setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType c setlocal ts=8 sts=8 sw=8
    autocmd FileType cpp setlocal ts=8 sts=8 sw=8
    autocmd FileType crontab setlocal nobackup nowritebackup
    autocmd FileType dockerfile setlocal ts=2 sts=2 sw=2
    autocmd FileType gitcommit setlocal spell formatoptions+=w
    autocmd FileType mail setlocal tw=70 spell formatoptions+=w
    autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType java setlocale ts=4 sts=4 sw=4
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 ts=79 autoindent
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType rust setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType markdown setlocal ts=4 sts=4 sw=4 nospell wrap linebreak nolist textwidth=79 formatoptions+=t
    autocmd FileType html setlocal ts=2 sts=2 sw=2
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2
    autocmd FileType css setlocal ts=2 sts=2 sw=2
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2
    autocmd FileType json setlocal ts=2 sts=2 sw=2

    autocmd BufNewFile,BufRead *.sh setlocal ft=sh
    autocmd BufNewFile,BufRead *.bash setlocal ft=bash
    autocmd BufNewFile,BufRead *.zsh setlocal ft=zsh
    autocmd BufNewFile,BufRead *.{c,h} setlocal ft=c
    autocmd BufNewFile,BufRead *.{cpp,h} setlocal ft=cpp
    autocmd BufNewFile,BufRead *.java setlocal ft=java
    autocmd BufNewFile,BufRead *.py setlocal ft=python
    autocmd BufNewFile,BufRead *.rb setlocal ft=ruby
    autocmd BufNewFile,BufRead *.go setlocal ft=go
    autocmd BufNewFile,BufRead *.rs setlocal ft=rust
    autocmd BufNewFile,BufRead *.html setlocal ft=html
    autocmd BufNewFile,BufRead *.js setlocal ft=javascript
    autocmd BufNewFile,BufRead *.css setlocal ft=css
    autocmd BufNewFile,BufRead *.json setlocal ft=json
    autocmd BufNewFile,BufRead *.yaml setlocal ft=yaml
    autocmd BufNewFile,BufRead *.md setlocal ft=markdown " spell spelllang=en_gb
augroup END

augroup configgroup
    autocmd VimResized * exe 'normal! \<c-w>='
    " Terminal statusline
    autocmd TermOpen * setlocal statusline=%{b:term_title}
augroup END

" vim:fenc=utf-8:ft=vim:
