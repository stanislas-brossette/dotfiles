
"neomake {{{
    let g:neomake_error_sign = {
          \ 'text': '>>',
          \ 'texthl': 'ErrorMsg',
          \ }
    let g:neomake_warning_sign = {
          \ 'text': '>>',
          \ 'texthl': 'WarningMsg',
          \ }

    let g:neomake_open_list = 1

    " Add clang-tidy support
    let g:neomake_c_clangtidy_args_conf = ['-p', '_build']

    let g:neomake_tex_proselint_maker = {
        \ 'exe': 'proselint',
        \ 'errorformat': '%f:%l:%c: %m',
        \ }

    " Run make
    nmap <Leader>b :Neomake!<CR>
  " }}}
