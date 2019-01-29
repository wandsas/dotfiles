" ~/.vimrc

scriptencoding utf-8

set nocompatible

filetype plugin indent on
syntax on

set shell=bash

" Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80

set autoindent
set smartindent
set copyindent
set breakindent
set smarttab
set magic

" Search
set hlsearch
set incsearch

" Folding
set clipboard=unnamed
set foldignore=" "
set foldenable
set foldlevelstart=99
set foldnestmax=10
set foldmethod=indent
set formatoptions=cqrt

set ignorecase
set smartcase
set timeoutlen=500
set ruler

" Status bar
set laststatus=2

" Last line
set showcmd
set showbreak=↪ " Show line wrapping
set showmatch

set lazyredraw

set listchars=tab:.\ ,extends:❯,precedes:❮
set modelines=1

set mat=2
set mouse=a
set novisualbell
set noerrorbells

" File handling
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,mac,dos
set modeline
set tags=./.tags:/
set viminfo='100,<100,s20,h
set history=50

set autoread
set autowrite
set hidden

" Cursor
set backspace=indent,eol,start
set matchpairs+=<:>
set gdefault
set shortmess+=I
set nocursorcolumn
set noequalalways
set nojoinspaces
set nocursorline
set nolist

" Line numbers
set number
set numberwidth=4
set relativenumber
set scrolloff=5

" Vertical splits
set noshiftround
set nopreserveindent
set splitbelow
set splitright
set textwidth=0
set wrap
set wrapmargin=0
set tagcase=followscs	" Follow smartcase and ignorecase when doing tag search
set wrapscan
set grepprg=rg\ --vimgrep

" Persistent undo
set nobackup
set noswapfile
set undodir=~/.cache/nvim
set undofile
set undolevels=100

" Set path variable to current directory
set path+=**

set wildmenu
set wildmode=longest,list:longest,full
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.bmp,*.gif,*.jpg,*.jpeg,*.png
set wildignore+=*.DS_Store,*.sw?,*.spl
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=go/pkg,go/bin,*.luac,*.pyc,*.zwc,node_modules

" Time out on key codes but not mappings.
" Basically this makes terminal Vim worksanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better completion
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

"  Colors
if $TERM == 'linux'
	set t_Co=8
else
	set t_Co=256
endif

colorscheme torte


" -----------------------------------------------------------------------------
"  Keybindings
" -----------------------------------------------------------------------------

" put leader to space
map <space> <leader>
map <space><space> <leader><leader>
"let mapleader = " "

" ensure that ctrl+u in insert mode can be reversed
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Navigate buffer next/prev: leader+./leader+,
noremap <leader>. :bn<CR>
noremap <leader>, :bp<CR>

" Navigate tab next/prev: tab/shift+tab
nnoremap <tab> <esc>:tabnext<cr>
nnoremap <s-tab> <esc>:tabprev<cr>

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

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf<Paste>

" vim:fenc=utf-8:ft=vim:ts=2:sts=0:sw=2:et:
