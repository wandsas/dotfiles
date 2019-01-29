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
set smarttab
set magic

" virtual line breaks on word boundaries with correct indentation
set linebreak
set breakindent

" remember tab names in sessions
set sessionoptions+=tabpages,globals,winpos,winsize,blank,resize

" always show the sign column to prevent flickering
set signcolumn=yes

" Search
set ignorecase " usually ignore case when searching
set smartcase  " unless a search term start with a capital letter
set hlsearch
set incsearch
set inccommand=nosplit

" reload changed files
" autocmd vimrc FocusGained * :checktime

" Folding
set clipboard=unnamedplus
set foldignore=" "
set foldenable
set foldlevelstart=99
set foldnestmax=20
set foldmethod=indent
set formatoptions=cqrt
set timeoutlen=500
set ruler

" Status bar
set laststatus=2

" Last line
set showcmd
set showmatch

set lazyredraw

set listchars=tab:.\ ,eol:¬,extends:❯,precedes:❮
set modelines=1

set mat=2
set mouse=a	" mouse in all modes
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

" detect lists when wrapping lines
set formatoptions+=n
let &formatlistpat='^\s*\(\d\+[\]:.)}\t ]\|[*-][\t ]\)\s*'

" spell checking
"set spell spelllang=en,de
set nospell

set autoread
set autowrite

set hidden
set noshowmode

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

" tab completion mode with partial match and list
set wildmode=longest,list:longest,full
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.bmp,*.gif,*.jpg,*.jpeg,*.png
set wildignore+=*.DS_Store,*.sw?,*.spl
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=go/pkg,go/bin,*.luac,*.pyc,*.zwc,node_modules

set notimeout
set ttimeout

" avoid delays when exitin insert mode with escape
set ttimeoutlen=0

" Better completion
set completeopt=longest,menuone

"  Colors
if $TERM == 'linux'
	set t_Co=8
	set colorcolumn=0
	colorscheme torte
else
	set t_Co=256
	set colorcolumn=80
	colorscheme OceanicNext
endif


" bracket matching settings
highlight MatchParen cterm=bold ctermbg=none ctermfg=9

" Enable italics
highlight Comment gui=italic
highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none

highlight DiffAdd ctermbg=2
highlight DiffDelete ctermbg=1
highlight DiffChange ctermbg=238
highlight DiffChange ctermbg=242
"highlight ColorColumn ctermbg=gray

" solid utf-8 line for splits
set fillchars=vert:\|

" vim:fenc=utf-8:ft=vim:ts=2:sts=2:sw=2:et:ai:
