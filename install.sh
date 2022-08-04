#!/bin/sh

# Vundle is the 'package manager' we use for the plugins, and it gets pulled in with this
git submodule init
git submodule update

# this causes Vundle to start installing all the plugins it needs to install
vim +PluginInstall +qall

