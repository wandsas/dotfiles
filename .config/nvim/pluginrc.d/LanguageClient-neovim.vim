let g:LanguageClient_autoStart = 1
let g:LanguageClient_settingsPath = 'ls-settings.json'
let g:LanguageClient_hoverPreview = 'Always'

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'cpp': ['clangd'],
    \ 'rust': ['rls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'html': ['html-languageserver', '--stdio'],
    \ 'css':  ['css-languageserver', '--stdio'],
    \ 'sass': ['css-languageserver', '--stdio'],
    \ 'json': ['json-languageserver', '--stdio'],
    \ 'yaml': ['yaml-language-server', '--stdio'],
    \ 'yaml.ansible': ['yaml-language-server', '--stdio'],
    \ 'xml':  ['xml-language-server'],
    \ 'dockerfile': ['docker-langserver', '--stdio'],
    \ 'java': ['jdtls', '-data', '~/.local/share/nvim/ls/java', '--add-modules=ALL-SYSTEM', '--add-opens', 'java.base/java.util=ALL-UNNAMED', '--add-opens', 'java.base/java.lang=ALL-UNNAMED'],
    \ 'puppet': ['puppet-languageserver', '--stdio'],
    \ }
