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
export NAME='Thomas Moulard'
export PAGER='less -R'
export FULLNAME='Thomas Moulard'
export EMAIL='thomas.moulard@gmail.com'
export REPLYTO=$EMAIL

export AIST_USERNAME='t02830'
export SF_USERNAME='thomas_moulard'

# Tools
export EDITOR='emacs'
export MAIL="/var/mail/$USER"
export CVS_RSH=ssh

test -x /usr/lib/ccache/gcc && export CC=/usr/lib/ccache/gcc
test -x /usr/lib/ccache/g++ && export CXX=/usr/lib/ccache/g++

export OMNIORB_CONFIG=$HOME/.dotfiles/.omniORB.cfg
export OMNINAMES_LOGDIR=$HOME/.omniorb

export AC3D_HOME=$HOME/Downloads/ac3dlx

export ROS_EMAIL="$EMAIL"

export KEYCHAIN_KEYS="$HOME/.ssh/id_rsa 31496D58"

export ROS_EMAILS=thomas.moulard@gmail.com

PATH+=/usr/local/texlive/2012/bin/x86_64-linux

#PROFILE="icc"
#PROFILE="default-i386-linux-ubuntu-10.04"
PROFILE=default-x86_64-linux-ubuntu-12.04.1

# Update LD_LIBRARY_PATH
LD_LIBARY_PATH=/opt/ros/fuerte/stacks/robot_model/urdf_parser/lib:$LD_LIBRARY_PATH
LD_LIBARY_PATH=/opt/NAG/cll6a23dhl/lib:$LD_LIBRARY_PATH
export LD_LIBARY_PATH
