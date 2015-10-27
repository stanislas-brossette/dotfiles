" UltiSnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Custom snippets
let g:UltiSnipsSnippetsDir='~/.dotfiles/custom_snippets'
let g:UltiSnipsSnippetDirectories=['custom_snippets', 'UltiSnips']
"let g:UltiSnipsSnippetDirectories=["custom_snippets"]
" Prevent UltiSnips from stealing ctrl-k.
augroup VimStartup
  autocmd!
  autocmd VimEnter * sil! iunmap <c-k>
  augroup end
    " Use ctrl-b instead.
    "let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
" }}}

