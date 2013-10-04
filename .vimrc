"Set my options
set nocompatible
set history=100
set autoindent
set ruler
set showcmd
set incsearch

"Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

"Filetype detection for indent and highlighting
filetype plugin indent on

"Map the 'Enter' key in Normal mode with adding a new line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"Map NERDTree on current dir to <F12>
map <F12> :NERDTreeToggle<CR>
