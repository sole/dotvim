sole's .vim dir
===============

This is my .vim directory put in a git repository since I saw more people doing it and I thought it was a terrific idea.

So what does make it particularly interesting?

### Miscellaneous settings ###

If you have a look at vimrc you'll see what I mean with miscellaneous!

By default it makes vim highlight the line the cursor is in, enables syntax highlighting, uses TABs instead of spaces (YES I PREFER TABS, accept it or stop reading!), also has some shortcuts for toggling white spaces, and the NERDtree file explorer.

### The colour scheme ###

I am using my own color scheme (imaginatively named "sole"), which is still very rough because I just began learning about vim's color schemes yesterday.
It looks much nicer in gvim than in gnome-terminal because the latter only allows for 16 palettised colours whereas gvim allows you to choose RGB colours.

If you don't like it... well, there are many other themes out there!
See this handy visual guide: http://vimcolorschemetest.googlecode.com/svn/html/index-c.html 

## Installing ##

Clone to a folder of your liking, e.g. ~/data/dotvim

```bash
git clone git://github.com/sole/dotvim.git ~/data/dotvim
```

Then link that to your ~/.vim folder:

```bash
cd ~/data/dotvim
ln -s ~/data/dotvim ~/.vim
```

That will not work if you already have a .vim directory.

Otherwise, run `./install.sh` to finish installing the plug-ins.

```bash
cd ~/data/dotvim
./install.sh
```

### Superfast install ###

I used to have this super fast install with wget which was super confusing in many ways. If you want to see it, then check out earlier revisions. (I might delete this section in the future!)

## Inspirations/sources ##

These are my inspirations/sources of knowledge:

### Tsung-Hsiang (Sean) Chang's .vim ###

I got the idea for the symlink to .vimrc here (and learnt that it has to be in ~/.vimrc)
https://github.com/vgod/vimrc


### Python and vim: Make your own IDE ###

A good guide about making Vim more comfortable for writing in Python.
http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/

### The fast install method ###

I took that idea from nvie's vimrc
https://github.com/nvie/vimrc
