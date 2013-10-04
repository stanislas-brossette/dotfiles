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

test -x /usr/lib/ccache/gcc && export CC=/usr/lib/ccache/gcc
test -x /usr/lib/ccache/g++ && export CXX=/usr/lib/ccache/g++

#export AC3D_HOME=$HOME/Downloads/ac3dlx

export KEYCHAIN_KEYS="$HOME/.ssh/id_rsa_idh"

export PATH="/usr/local/texlive/2012/bin/x86_64-linux:$PATH"

#PROFILE="icc"
#PROFILE="default-i386-linux-ubuntu-10.04"
PROFILE=pcl-x86_64-linux-ubuntu-12.04.2

# Update LD_LIBRARY_PATH
LD_LIBARY_PATH=/opt/ros/fuerte/stacks/robot_model/urdf_parser/lib:$LD_LIBRARY_PATH
LD_LIBARY_PATH=/opt/NAG/cll6a23dhl/lib:$LD_LIBRARY_PATH
export LD_LIBARY_PATH

export OPENNI2_INCLUDE=/usr/include/openni2
export OPENNI2_REDIST=/usr/lib
