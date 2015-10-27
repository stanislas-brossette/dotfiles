" Unite {{{
" General options
let g:unite_enable_start_insert = 1
let g:unite_data_directory = expand("~/.vim/unite")
let g:unite_source_history_yank_enable = 1

"call unite#custom#profile('default', 'context', {
"\ 'winheight': 10,
"\ 'direction': 'botright',
"\ 'prompt': '» ',
"\ })

"" Ignore build directories
"call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\/build')
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\/_build')
call unite#custom#source('grep', 'ignore_pattern', '\/_build')
"call unite#custom#source('grep', 'ignore_pattern', '\/build')

" File
let g:unite_source_file_ignore_pattern =
      \'_build\|tmp\|^\%(/\|\a\+:/\)$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$'

" Search
let g:unite_source_grep_max_candidates=1000
let g:unite_source_find_max_candidates=1000

" silver_searcher
if executable('/usr/bin/ag')
  let g:unite_source_grep_command = '/usr/bin/ag'
  let g:unite_source_grep_default_opts = '-f --line-numbers --nocolor --nogroup -i ' .
        \ '--hidden --ignore ".hg" --ignore ".svn" --ignore ".git" ' .
        \ '--ignore "bzr" --ignore ".svg"  '
  let g:unite_source_grep_recursive_opt = ''
endif

" Unite {{{
nnoremap [unite] <Nop>
nmap ' <SID>[unite]

nnoremap <SID>[unite]u :<C-u>Unite
nnoremap <SID>[unite]' :<C-u>Unite buffer file<CR>
nnoremap <SID>[unite]b :<C-u>Unite buffer<CR>
nnoremap <SID>[unite]f :<C-u>Unite file<CR>
nnoremap <SID>[unite]F :<C-u>Unite file_rec<CR>
"nnoremap <SID>[unite]H :<C-u>Unite help<CR>
"nnoremap <SID>[unite]t :<C-u>Unite tag<CR>
"nnoremap <SID>[unite]T :<C-u>Unite -immediately -no-start-insert tag:<C-r>=expand('<cword>')<CR><CR>
nnoremap <SID>[unite]w :<C-u>Unite tab<CR>
"nnoremap <SID>[unite]m :<C-u>Unite file_mru<CR>
nnoremap <SID>[unite]o :<C-u>Unite outline<CR>
nnoremap <SID>[unite]q :<C-u>Unite qf -no-quit<CR>
"nnoremap <SID>[unite]M :<C-u>Unite mark<CR>
nnoremap <SID>[unite]r :<C-u>Unite register<CR>
nnoremap <SID>[unite]g :<C-u>Unite grep -no-quit -direction=botright -buffer-name=grep-buffer<CR>

" Grep-like search
nnoremap <Leader>/  :Unite grep -no-quit<CR><CR>
nnoremap <Leader>// :Unite grep -no-quit<CR>
vnoremap <Leader>/  y:Unite grep -no-quit<CR><CR><C-R>=escape(@", '\\.*$^[]')<CR><CR>

" File search, CtrlP style
nnoremap <C-p> :<C-u>Unite -buffer-name=files -start-insert -default-action=open file_rec/async:!<CR>
nnoremap <C-p>p :<C-u>Unite -buffer-name=files -start-insert -default-action=open file_rec/async:
"" }}}oremap <space>s :Unite -quick-match buffer<cr>

