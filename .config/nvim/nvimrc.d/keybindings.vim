scriptencoding utf-8

" ensure that ctrl+u in insert mode can be reversed
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" put leader to space
map <space> <leader>
map <space><space> <leader><leader>
"let mapleader = " "

" Navigate buffer next/prev: leader+./leader+,
noremap <leader>. :bn<CR>
noremap <leader>, :bp<CR>

" Navigate tab next/prev: tab/shift+tab
nnoremap <Tab> <ESC>:tabnext<CR>
nnoremap <S-Tab> <ESC>:tabprev<CR>

" Navigate tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" window movement
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Sane mouse scrolling-
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" cd directory to the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" redraw screen
nnoremap <leader>r <ESC>:redraw!<CR>

" toggle paste mode
set pastetoggle=<F2>

" Tagbar <F8>
nmap <F8> :TagbarToggle<CR>

" Update timestamp
iab YDATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
map ,L  1G/Latest change:\s*/e+1<CR>CYDATE<ESC>

" Fix whitespace
nnoremap <silent> <leader>t :StripWhitespace<CR>

" Remove search highlight
nnoremap <ESC><ESC> :noh<CR>

" Sort
vnoremap <silent> <F5> :sort<CR>

" Spell checking
map <leader>ss :setlocal spell!<cr>

" Fast quit <leader>q
nmap <leader>q :q!<cr>

" Fast saving <leader>w
nmap <leader>w :w!<cr>

" Sudo save :W
command W w !sudo tee % >/dev/null

" Make Y not dumb
nnoremap Y y$

" Search centers result
nnoremap n nzzzv
nnoremap N Nzzzv

" Quick escape insert mode
inoremap jj <ESC>
inoremap \\ <ESC>

" Think "little tabs" and "big tabs"
map \t <Esc>:set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>
map \T <Esc>:set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>

" Toggle folds <leader>
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf

" vim:fenc=utf-8:ft=vim:ts=2:sts=0:sw=2:et:
