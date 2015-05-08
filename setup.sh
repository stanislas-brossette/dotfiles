#!/bin/sh

set -e

if ! `test x$(basename $(pwd)) = x.dotfiles`; then
 echo "please run ./setup.sh from .dotfiles directory"
 exit 1
fi

dotfiles=`find . -maxdepth 1 -type f -and -name '.*'`
for i in $dotfiles; do
 ln -sf `pwd`/$i $HOME/$i
done

ln -sf `pwd`/.emacs.d ~/.emacs.d

# create directories if necessary
mkdir ~/.ssh 2> /dev/null || true
mkdir ~/.gnupg 2> /dev/null || true

ln -sf `pwd`/.ssh/config ~/.ssh/config
ln -sf `pwd`/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

# Add custom snippets
ln -sf `pwd`/custom_snippets $HOME/.vim/plugged/vim-snippets/ 

echo "symbolic links have been created successfully"
