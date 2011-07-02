#!/bin/sh

[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

git clone git://github.com/sole/dotvim.git ~/.vim

cd ~./vim

# Set up the symlinks to vimrc and gvimrc
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.vimrc

# This is for NERDTree... although I might use other plugins later on!
git submodule init
git submodule update

# Symlink the plugin file in the bundle to the required place
ln -s ~/.vim/bundle/nerdtree/plugin/NERD_tree.vim ~/.vim/plugin/NERD_tree.vim
