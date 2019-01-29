let g:deoplete#enable_at_startup = 1
let g:deoplete#max_menu_width = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_smart_case = 1
"call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
"if !exists('g:deoplete#omni#input_patterns')
"    let g:deoplete#omni#input_patterns = {}
"endif

let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
let g:clang_use_library = 1
let g:clang_complete_macros = 1
let g:clang_auto_user_options = 'compile_commands.json'
" let g:clang_complete_patterns = 1

" javascript settings
let g:jsx_ext_required = 1
let g:deoplete#sources#ternjs#types = 1
