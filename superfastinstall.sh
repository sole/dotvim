#!/bin/sh

[ -e "~/.vim" ] && die "~/.vim already exists."

git clone git://github.com/sole/dotvim.git ~/.vim

cd ~/.vim

sh install.sh
