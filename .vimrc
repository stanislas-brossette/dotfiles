" disable vi compatibility (emulation of old bugs)
set nocompatible

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" NeoComplete
Plug 'Shougo/neocomplete.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_refresh_always = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 3
"let g:neocomplete#enable_prefetch = 1
let g:neocomplete#skip_auto_completion_time = "0.1"
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 4
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#use_vimproc = 1
let g:neocomplete#enable_omni_fallback = 0

" VimProc
Plug 'Shougo/vimproc.vim', { 'do': 'make'}

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" SuperTab
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<Tab>'
let g:SuperTabBackward = '<C-S-Tab>'

" UltiSnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Custom snippets
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/vim-snippets/custom_snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]
" Prevent UltiSnips from stealing ctrl-k.
augroup VimStartup
autocmd!
autocmd VimEnter * sil! iunmap <c-k>
augroup end
" Use ctrl-b instead.
"let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
" }}}

" DoxygenToolkit.vim : Simplify Doxygen documentation in C, C++, Python. 
Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_commentType = "C++"

call plug#end()

" System clipboard support
if has('clipboard')
  if has('unnamedplus') " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
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
set textwidth=8000
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


" Press F3 to toggle highlighting on/off, and show current value.
noremap <F3> :set hlsearch! hlsearch?<CR>
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" in normal mode F5 will save the file
nmap <F5> :w<CR>
" in insert mode F5 will exit insert, save, enters insert again
imap <F5> <ESC>:w<CR>i
" F3: Toggle list (display unprintable characters).
nnoremap <F9> :set list!<CR>
" Press F10 to toggle set number on/off, and show current value.
noremap <F10> :set number! number?<CR>

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
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Disable Ex mode
nnoremap Q <nop>
