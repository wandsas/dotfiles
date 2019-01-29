let g:vimwiki_list = [{
    \ 'path': '~/.vimwiki',
    \ 'syntax': 'markdown',
    \ 'ext': '.md',
    \ 'template_path': '~/.vimwiki/templates/',
    \ 'template_default': 'default',
    \ 'template_ext': '.html',
    \ 'path_html': '~/.vimwiki/site_html/',
    \ 'custom_wiki2html': 'vimwiki_markdown',
    \ 'use_calendar': 1,
    \ 'autochdir': 1,
    \ 'auto_toc': 1,
    \ 'auto_tags': 1}]

"autocmd FileType vimwiki call SetMarkdownOptions()

"function! SetMarkdownOptions()
"  call VimwikiSet('syntax', 'markdown')
"  call VimwikiSet('custom_wiki2html', 'wiki2html.sh')
"endfunction
