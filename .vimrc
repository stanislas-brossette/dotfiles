" Avertissement par flash (visual bell) plutôt que par beep
" set vb

" Active la coloration syntaxique
syntax on

" Définit le jeu de couleurs utilisé
" Les jeux de couleur disponibles sont les fichiers avec l'extension .vim
" dans le répertoire /usr/share/vim/vimcurrent/colors/
colorscheme delek

" Affiche la position du curseur 'ligne,colonne'
set ruler
" Affiche une barre de status en bas de l'écran
set laststatus=2
" Contenu de la barre de status
set statusline=%<%f%h%m%r%=%l,%c\ %P

" Largeur maxi du texte inséré
" '72' permet de wrapper automatiquement à 72 caractères
" '0' désactive la fonction
set textwidth=0

" Wrappe à 72 caractères avec la touche '#'
map # gwap
" Wrappe et justifie à 72 caractères avec la touche '@'
map @ {v}! par 72j

" Ne pas assurer la compatibilité avec l'ancien Vi
set nocompatible
" Nombre de colonnes (inutile, voire gênant)
"set columns=80
" Nombre de commandes dans l'historique
set history=100
" Options du fichier ~/.viminfo
set viminfo='20,\"50
" Active la touche Backspace
set backspace=2
" Autorise le passage d'une ligne à l'autre avec les flèches gauche et droite
set whichwrap=<,>,[,]
" Garde toujours une ligne visible à l'écran au dessus du curseur
set scrolloff=1
" Affiche les commandes dans la barre de status
set showcmd
" Affiche la paire de parenthèses
set showmatch
" Essaye de garder le curseur dans la même colonne quand on change de ligne
set nostartofline
" Option de la complétion automatique
set wildmode=list:full
" Par défaut, ne garde pas l'indentation de la ligne précédente
" quand on commence une nouvelle ligne
set noautoindent
" Options d'indentation pour un fichier C
set cinoptions=(0

" xterm-debian est un terminal couleur
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

" Quand on fait de la programmation, on veut qu'il n'y ait jamais de
" vraies tabulations insérées mais seulement des espaces
set expandtab
set tabstop=4

" Décommentez les 2 lignes suivantes si vous voulez avoir les tabulations et
" les espaces marqués en caractères bleus
"set list
"set listchars=tab:>-,trail:-

" Les recherches ne sont pas 'case sensitives'
set ignorecase

" Le découpage des folders se base sur l'indentation
set foldmethod=indent
" 12 niveaux d'indentation par défaut pour les folders
set foldlevel=12

" Recherches incrémentalees : rechercher au fur et à mesure qu'on
" tape le motif de recherche
set incsearch
" Mettre en surbrillance le mot cherché
set hlsearch

" Décommentez la ligne suivante si vous voulez afficher les numéros de ligne
"set number

"Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

"Filetype detection for indent and highlighting
filetype plugin indent on

"Map the 'Enter' key in Normal mode with adding a new line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"Map NERDTree on current dir to <F12>
map <F12> :NERDTreeToggle<CR>
