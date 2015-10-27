" disable vi compatibility (emulation of old bugs)
set nocompatible

call plug#begin('~/.vim/plugged')

" set leader keys
let mapleader = ','
let maplocalleader = ';'

" Unite and create user interfaces 
" http://www.vim.org/scripts/script.php?script_id=3396
Plug 'Shougo/unite.vim'

Plug 'thinca/vim-qfreplace'

" Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Enhanced syntax highlighting for C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Enhanced syntax highlighting for C++
Plug 'tpope/vim-fugitive'

" A simple Vim plugin to switch segments of text with predefined replacements
Plug 'AndrewRadev/switch.vim'

" Using git URL
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

"" NeoComplete
"Plug 'Shougo/neocomplete.vim'
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 0
"let g:neocomplete#enable_refresh_always = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 0
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#auto_completion_start_length = 3
""let g:neocomplete#enable_prefetch = 1
"let g:neocomplete#skip_auto_completion_time = "0.1"
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 4
""let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplete#use_vimproc = 1
"let g:neocomplete#enable_omni_fallback = 0
"inoremap <expr><Tab> pumvisible() ? \<Tab>" : neocomplete#start_manual_complete()
" VimProc
Plug 'Shougo/vimproc.vim', { 'do': 'make'}

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" SuperTab
Plug 'ervandew/supertab'

" DoxygenToolkit.vim : Simplify Doxygen documentation in C, C++, Python. 
Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_commentType = "C++"

Plug 'scrooloose/nerdcommenter'

Plug 'kien/ctrlp.vim'

call plug#end()

source ~/.dotfiles/vimConfigs/unite.vim
source ~/.dotfiles/vimConfigs/ctrlP.vim
source ~/.dotfiles/vimConfigs/superTab.vim
source ~/.dotfiles/vimConfigs/ultiSnips.vim
source ~/.dotfiles/vimConfigs/switch.vim

" System clipboard support
if has('clipboard')
  "if has('unnamedplus') " When possible use + register for copy-paste
  "set clipboard=unnamed,unnamedplus
  "else " On mac and Windows, use * register for copy-paste
  "set clipboard=unnamed
  "endif
endif

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 2 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
"set textwidth=80
" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0
set wrap linebreak nolist

" turn syntax highlighting on
set t_Co=256
syntax on
"color"
let g:hybrid_use_Xresources = 1
colorscheme hybrid
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

" Allow mouse use
set mouse=a


" Press F3 to toggle highlighting on/off, and show current value.
noremap <F3> :set hlsearch! hlsearch?<CR>
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" in normal mode F5 will save the file
nmap <F5> :w<CR>
" in insert mode F5 will exit insert, save, enters insert again
imap <F5> <ESC>:w<CR>i
" F3: Toggle list (display unprintable characters).
map <F6> :so ~/.dotfiles/.vimrc<CR>

"F7 reindents a whole file"
map <F7> mzgg=G`z

nnoremap <F9> :set list!<CR>
" Press F8 to toggle set number on/off, and show current value.
noremap <F8> :set number! number?<CR>

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

" enable persistant undo history
set undofile
" set a directory to store the undo history
set undodir=~/.vimundo/

"Store swap files in fixed location, not current directory.
set dir=~/.dotfiles/.vimswap//,/var/tmp//,/tmp//,.

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list "displays all invisible characters"

"Filetype detection for indent and highlighting
filetype plugin indent on

"Map NERDTree on current dir to <F12>
map <F12> :NERDTreeToggle<CR>

" vimrc de Ben
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set completeopt+=menuone
set completeopt-=preview
" Default Vim completion should not look for all include files (slow)
set complete-=i
" Default Vim completion should not look for all tags (slow)
set complete-=t
" When the popup menu is opened, make the Enter key select the completion
" entry instead of creating a new line
set cursorline " Highlight current line
" Limit syntax highlighting with
set synmaxcol=200
"Fast terminal
set ttyfast

" System clipboard support
if has('clipboard')
  if has('unnamedplus') " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Disable Ex mode
nnoremap Q <nop>

map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>
