" vimtex {{{
"let g:vimtex_latexmk_build_dir = './build'
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'

" Remap double click for latex
autocmd FileType tex nnoremap <silent> <2-LeftMouse> :VimtexView<CR>
" }}}
