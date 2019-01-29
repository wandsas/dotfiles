let g:ale_sign_column_always = 1
let g:ale_lint_on_text_change = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" ale settings
let g:ale_echo_msg_format = '[%linter%] %s% (code)% [%severity%]'
let g:ale_linters = {
    \ 'tex': ['alex', 'proselint', 'chktex', 'write-good', 'vale'],
    \ 'python': ['flake8'],
    \ 'javascript': ['eslint', 'flow']
    \ }

highlight ALEError cterm=undercurl ctermfg=196
highlight ALEInfo cterm=undercurl ctermfg=14
