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

# My aliases
alias make='nocorrect make'
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias m="nocorrect make -j3 -k"

export ALTERNATE_EDITOR="" # Should start emacs --daemon if emacsclient runs without one.
alias e='emacsclient -t'
alias ec='emacsclient -c'

DISABLE_AUTO_UPDATE="true"
plugins=(git github debian screen dev-profile keychain hrp2 cmake-build-dir)

source $ZSH/oh-my-zsh.sh

function sparseColor ()
{
    sed "s|[+-]0.00000000|`printf \"\e[1;30m+0.00000000\e[0m\"`|g" "$*"| less -SR
}

setopt autocd

if [ -f  $HOME/.travis/travis.sh ]; then
    . /home/moulard/.travis/travis.sh
fi

if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi
