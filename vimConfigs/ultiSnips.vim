" UltiSnips
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"
"let g:UltiSnipsListSnippets="<s-Space>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Custom snippets
"let g:UltiSnipsSnippetsDir='~/.dotfiles/custom_snippets'
"let g:UltiSnipsSnippetDirectories=['custom_snippets', 'UltiSnips']
"let g:UltiSnipsSnippetDirectories=["custom_snippets"]
let g:UltiSnipsSnippetDirectories=["UltiSnips", "/home/stanislas/.dotfiles/custom_snippets"]
" Prevent UltiSnips from stealing ctrl-k.
augroup VimStartup
  autocmd!
  autocmd VimEnter * sil! iunmap <c-k>
  augroup end
    " Use ctrl-b instead.
    "let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
"

