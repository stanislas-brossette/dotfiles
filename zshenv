# -*- shell-script -*-
#
# This file is sourced on all invocations of the shell.
# If the -f flag is present or if the NO_RCS option is
# set within this file, all other initialization files
# are skipped.
#
# This file should contain commands to set the command
# search path, plus other important environment variables.
# This file should not contain commands that produce
# output or assume the shell is attached to a tty.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

# Identity
export NAME='Stanislas Brossette'
export PAGER='less -R'
export FULLNAME='Stanislas Brossette'
export EMAIL='stanislas.brossette@gmail.com'
export REPLYTO=$EMAIL

export AIST_USERNAME='s00402'

export MAIL=$HOME/Mail

# Tools
export EDITOR='vim'
export MAIL="/var/mail/$USER"
export CVS_RSH=ssh

alias gitk="gitk --all"

test -x /usr/lib/ccache/gcc && export CC=/usr/lib/ccache/gcc
test -x /usr/lib/ccache/g++ && export CXX=/usr/lib/ccache/g++

export KEYCHAIN_KEYS="$HOME/.ssh/id_rsa_idh"

PROFILE="default-x86_64-linux-ubuntu-13.04"

# qpdfview synctex vim synchronization
# for qpdfview
#vim --servername LATEX --remote-silent +%2<Enter> %1

# for alias in .bashrc
alias vimtex='vim --servername LATEX'
alias nvimtex="NVIM_LISTEN_ADDRESS=/tmp/nvim_tex.sock nvim"
