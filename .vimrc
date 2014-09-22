
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 2 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=80
" turn syntax highlighting on
set t_Co=256
syntax on
"color"
colorscheme delek
" turn line numbers on
" set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" Affiche la position du curseur 'ligne,colonne'
set ruler
" Affiche une barre de status en bas de l'écran
set laststatus=2
" Contenu de la barre de status
set statusline=%<%f%h%m%r%=%l,%c\ %P
" Autorise le passage d'une ligne à l'autre avec les flèches gauche et droite
set whichwrap=<,>,[,]


" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Command history length
set history=1000
" Always keep a visible line above cursor
set scrolloff=1
" Affiche les commandes dans la barre de status
set showcmd

" Les recherches ne sont pas 'case sensitives'
set ignorecase
" Searching starts after you enter the string
set incsearch
" Turns on search highlighting
set hlsearch

" Press F3 to toggle highlighting on/off, and show current value.
noremap <F3> :set hlsearch! hlsearch?<CR>

"Store swap files in fixed location, not current directory.
set dir=~/.dotfiles/.vimswap//,/var/tmp//,/tmp//,.

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list "displays all invisible characters"

"Filetype detection for indent and highlighting
filetype plugin indent on

execute pathogen#infect()

"Map NERDTree on current dir to <F12>
map <F12> :NERDTreeToggle<CR>
