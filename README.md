sole's .vim dir
===============

This is my .vim directory put in a git repository since I saw more people doing it and I thought it was a terrific idea.

To install, clone the repo into your own .vim directory, like this:

	git clone git://github.com/sole/dotvim.git ~/.vim

You also have to make a symbolic link to .vim/vimrc and place it in ~/.vimrc. Or you can use the install_vimrc.sh script.
If you're using gvim you'll want to symlink the same file to ~/.gvimrc, or again you can use the script which does it too.

	ln -s ~/.vim/gvimrc ~/.vimrc

I am using my own color scheme (imaginatively named "sole"), which is still very rough because I just began learning about vim's color schemes yesterday.
It looks much nicer in gvim than in gnome-terminal because the latter only allows for 16 palettised colours whereas gvim allows you to choose RGB colours.

If you don't like it... well, there are many other themes out there!

## Inspirations/sources ##

These are my inspirations/sources of knowledge:

### Tsung-Hsiang (Sean) Chang's .vim ###
https://github.com/vgod/vimrc

I got the idea for the symlink to .vimrc here (and learnt that it has to be in ~/.vimrc)
