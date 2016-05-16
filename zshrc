# -*- mode: sh -*-
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/oh-my-zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="junkfood"

# aliases
alias gitk="gitk --all"
alias make='nocorrect make'
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias e=emacs
alias v=nvim
alias gy=geany
alias qt=qtcreator
alias m=make
alias m='make -j7'
alias src='source'
alias srcfuerte='source /opt/ros/fuerte/setup.zsh'
alias srcgroovy='source /opt/ros/groovy/setup.zsh'
alias srchydro='source /opt/ros/hydro/setup.zsh'
alias reload='source ~/.zshrc'
alias valgr='valgrind --tool=memcheck --track-origins=yes --show-reachable=yes --leak-check=yes --error-limit=no'
alias cleanTmp="find -name '*~' -exec echo mv \{\} /tmp \;"
alias clang-format=clang-format-3.6

# qpdfview synctex vim synchronization
# for qpdfview
#vim --servername LATEX --remote-silent +%2<Enter> %1
alias vimtex='vim --servername LATEX'
alias nvimtex="NVIM_LISTEN_ADDRESS=/tmp/nvim_tex.sock nvim"

# set terminal to 256 colors
TERM=xterm-256color
#alias tmux="tmux

export ALTERNATE_EDITOR="vim" # Should start emacs --daemon if emacsclient runs without one.
alias e='emacsclient -t'
alias ec='emacsclient -c'

DISABLE_AUTO_UPDATE="true"
plugins=(git github debian screen dev-profile keychain hrp2 ros cmake-build-dir autojump command-not-found nyan web-search)

source $ZSH/oh-my-zsh.sh

function sparseColor ()
{
    sed "s|[+-]0.00000000|`printf \"\e[1;30m+0.00000000\e[0m\"`|g" "$*"| less -SR
}

setopt autocd

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

# bing ctrl+L to clear screen
bindkey -s '^l' clear; echo -e "\033c\e[3J"

#bind Caps Lock to escape
xcape -e '#66=Escape'

export CDPATH="$CDPATH:$ps"

setopt no_share_history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Init Tmuxifier
export TMUXIFIER_TMUX_OPTS="-2"
eval "$(tmuxifier init -)"
