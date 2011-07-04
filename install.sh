#!/bin/sh

# Set up the symlinks to vimrc and gvimrc
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# This is for NERDTree... although I might use other plugins later on!
git submodule init
git submodule update

# Symlink the plugin file in the bundle to the required place
mkdir ~/.vim/plugin
ln -s ~/.vim/bundle/nerdtree/plugin/NERD_tree.vim ~/.vim/plugin/NERD_tree.vim
