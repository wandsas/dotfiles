let g:airline_powerline_fonts = 0
let g:airline_theme='oceanicnext'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_symbols.crypt = 'π'
let g:airline_symbols.linenr = 'β'
let g:airline_symbols.maxlinenr = ' β°'
let g:airline_symbols.branch = 'β'
let g:airline_symbols.notexists = 'β'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.spell = 'β'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = 'Γ'
let g:airline#extensions#tabline#show_close_button = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap Β‘ <Plug>AirlineSelectTab1
nmap β’ <Plug>AirlineSelectTab2
nmap Β£ <Plug>AirlineSelectTab3
nmap Β’ <Plug>AirlineSelectTab4
nmap β <Plug>AirlineSelectTab5
nmap Β§ <Plug>AirlineSelectTab6
nmap ΒΆ <Plug>AirlineSelectTab7
nmap β’ <Plug>AirlineSelectTab8
nmap Βͺ <Plug>AirlineSelectTab9
nmap β€ <Plug>AirlineSelectPrevTab
nmap β₯ <Plug>AirlineSelectNextTab


" already visible in gutter
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 1
" not needed
let g:airline#extensions#branch#enabled = 0
" already done by another plugin
let g:airline#extensions#whitespace#checks =[' indent', 'mixed-indent-file']
"let g:airline_left_sep = 'β'
"let g:airline_right_sep = 'β'
" make things more compact
let g:airline_mode_map = {
    \ '__': '-',
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'c' : 'C',
    \ 'v' : 'V',
    \ 'V' : 'V',
    \ '': 'V',
    \ 's' : 'S',
    \ 'S' : 'S',
    \ '': 'S',
    \ }

let g:airline_section_z = '%4l/%L'
