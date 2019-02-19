" vim-linux-coding-style

let g:linuxsty_patterns = [ "/usr/src/", "~/src" ]

" enable linux coding style on demand
nnoremap <silent> <leader>a :LinuxCodingStyle<cr>
