let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2D353D ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#343D46 ctermbg=4

highlight IndentGuidesOdd  guibg=red   ctermbg=234
highlight IndentGuidesEven guibg=green ctermbg=236

" Detect indent settings
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
