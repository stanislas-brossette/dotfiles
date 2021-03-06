
"""""""""""""
"  PLUGINS  "
"""""""""""""

call plug#begin('~/.vim/plugged')

" set leader keys
let mapleader = "\<Space>"
let maplocalleader = ','

" Unite and create user interfaces
" http://www.vim.org/scripts/script.php?script_id=3396
Plug 'Shougo/unite.vim'

"Dark powered asynchronous completion framework for neovim
function! DoRemote(arg)
 "UpdateRemotePlugins
endfunction
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"let g:deoplete#enable_at_startup = 1

"A code-completion engine for Vim http://valloric.github.io/YouCompleteMe/
Plug 'Valloric/YouCompleteMe'

"Perform the replacement in quickfix.
Plug 'thinca/vim-qfreplace'

" Interactive command execution in Vim
Plug 'Shougo/vimproc.vim', { 'do': 'make'}

" A modern vim plugin for editing LaTeX files.
Plug 'lervag/vimtex'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" Syntax checking hacks for vim
"Plug 'scrooloose/syntastic'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" Enhanced syntax highlighting for C++
Plug 'octol/vim-cpp-enhanced-highlight'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
" http://www.vim.org/scripts/script.php?script_id=2975
Plug 'tpope/vim-fugitive'

"A plugin for asynchronous :make using Neovim's job-control functionality
Plug 'benekastah/neomake'

"Proselint plugin for Vim
Plug 'amperser/proselint'

" UltiSnips - The ultimate snippet solution for Vim. Send pull
" requests to SirVer/ultisnips!_.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" DoxygenToolkit.vim : Simplify Doxygen documentation in C, C++, Python.
Plug 'vim-scripts/DoxygenToolkit.vim'

"A plugin for automatically restoring file's cursor position and folding
"http://www.vim.org/scripts/script.php?script_id=4021"
"Plug 'vim-scripts/restore_view.vim'

" File type plugin for folding TeX files http://www.vim.org/scripts/script.php?script_id=4702
"Plug 'matze/vim-tex-fold'

" Maintains a history of previous yanks, changes and deletes http://www.vim.org/scripts/script.php?script_id=1234
"Plug 'vim-scripts/YankRing.vim'

"A light and configurable statusline/tabline for Vim http://www.vim.org/scripts/script.php?script_id=5294
"Plug 'itchyny/lightline.vim'

"lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'
Plug 'powerline/fonts'

"A dark color scheme for Vim & gVim
"Plug 'w0ng/vim-hybrid'

call plug#end()
source ~/.dotfiles/vimConfigs/unite.vim
source ~/.dotfiles/vimConfigs/ultiSnips.vim
source ~/.dotfiles/vimConfigs/vimtex.vim
source ~/.dotfiles/vimConfigs/neomake.vim
source ~/.dotfiles/vimConfigs/doxygenToolkit.vim
"source ~/.dotfiles/vimConfigs/texfold.vim
source ~/.dotfiles/vimConfigs/vim_cpp_enhanced_highlight.vim
source ~/.dotfiles/vimConfigs/airline.vim

"""""""""""""""""""
"  BASIC OPTIONS  "
"""""""""""""""""""

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set encoding=utf-8

" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 2 spaces
set expandtab        " expand tabs to spaces

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0
set wrap linebreak nolist

" use indentation of previous line
set autoindent
" use intelligent indentation for c
set smartindent

" turn syntax highlighting on
set t_Co=256
syntax on
"color"
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" Recognize .tex files as LaTeX
let g:tex_flavor='latex'

" Affiche la position du curseur 'ligne,colonne'
"set ruler

" Highlight current line
"set cursorline

" Affiche une barre de status en bas de l'écran
set laststatus=2

" Contenu de la barre de status
set statusline=%<%f%h%m%r%=%l,%c\ %P
" Autorise le passage d'une ligne à l'autre avec les flèches gauche et droite
set whichwrap=<,>,h,l,[,]

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

"set list displays all invisible characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"No auto fold on startup
"set foldlevelstart=99
set foldmethod=marker

" No swap files
set noswapfile

"Enable use of mouse cursor
set mouse=a


" System clipboard support
if has('clipboard')
 if has('unnamedplus') " When possible use + register for copy-paste
   set clipboard=unnamed,unnamedplus
 else " On mac and Windows, use * register for copy-paste
   set clipboard=unnamed
 endif
endif

" Disable Ex mode
nnoremap Q <nop>

"Filetype detection for indent and highlighting
filetype plugin indent on

"""""""""""""""
"  FUNCTIONS  "
"""""""""""""""

" Zoom / Restore window.
function! s:ZoomToggle() abort
 if exists('t:zoomed') && t:zoomed
   execute t:zoom_winrestcmd
   let t:zoomed = 0
 else
   let t:zoom_winrestcmd = winrestcmd()
   resize
   vertical resize
   let t:zoomed = 1
 endif
endfunction
command! ZoomToggle call s:ZoomToggle()


""""""""""""""
"  MAPPINGS  "
""""""""""""""

" Easy zooming
nnoremap <silent> <Leader><Leader> :ZoomToggle<CR>

" Press F3 to toggle highlighting on/off, and show current value.
noremap <F3> :set hlsearch! hlsearch?<CR>
" in normal mode F5 will save the file
nmap <F5> :w<CR>
" in insert mode F5 will exit insert, save, enters insert again
imap <F5> <ESC>:w<CR>i
" Reload vimrc
map <F6> :so ~/.nvimrc<CR>
" Press F8 to toggle set number on/off, and show current value.
noremap <F8> :set number! relativenumber! number?<CR>
" Display trailing characters
nnoremap <F9> :set list!<CR>
"Map NERDTree on current dir to <F12>
map <F12> :NERDTreeToggle<CR>

" Map Ctrl+k to clang-format in normal mode
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Disable the arrow keys in normal mode
"map <up> :echoerr "Use hjkl instead of arrows!!!"<CR>
"map <down> :echoerr "Use hjkl instead of arrows!!!"<CR>
"map <left> :echoerr "Use hjkl instead of arrows!!!"<CR>
"map <right> :echoerr "Use hjkl instead of arrows!!!"<CR>

tnoremap <Esc><Esc> <C-\><C-n>
