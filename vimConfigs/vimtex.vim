" vimtex {{{
let g:vimtex_latexmk_build_dir = './build'
let g:vimtex_latexmk_progname = 'nvr'
"let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_complete_enabled = 1

" Disable the options that slow down nvim
let g:vimtex_motion_matchparen = 0
let g:vimtex_indent_enabled = 0

" Remap double click for latex
autocmd FileType tex nnoremap <silent> <2-LeftMouse> :VimtexView<CR>
" }}}
