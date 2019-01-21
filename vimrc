" FOR VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



set showmode
set showcmd
set autoindent
set hlsearch
set showmatch

" SET COLOR SCHEME
:colorscheme sole

" ENABLE SYNTAX HIGHLIGHT
syntax enable

" HIGHLIGHT CURSOR LINE
set cursorline

" HIDE / SHOW INVISIBLE CHARS
" Toggles `set list`, for alternating between showing or hiding invisible chars
" To toggle, enter \l as a command (backward slash lowercase L)
nmap <leader>l :set list!<CR>

" Using same symbols as TextMate
set listchars=tab:▸\ ,eol:¬

" SPACES & TABS
" Explanations from http://tedlogan.com/techblog3.html
set tabstop=4     " How many columns a tab counts for
set softtabstop=4 " How many columns vim uses when pressing TAB in insert mode
set shiftwidth=4  " How many columns text is indented with << and >>
set noexpandtab   " Don't insert spaces when pressing TAB

" NICER WORD WRAPPING
" inspired by http://contsys.tumblr.com/post/491802835/vim-soft-word-wrap
:set formatoptions=1
:set linebreak
:set breakat=\ |@-+;:,./?^I
" for navigating between lines and not between paragraphs
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

" LINE NUMBERS
set number

" DISABLE CREATION OF SWAP FILES
set noswapfile

" REMAP CONTROL+V AND CONTROL+C TO PASTE AND COPY RESPECTIVELY
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y



" HTML CLOSE TAGS
" http://vim.sourceforge.net/scripts/script.php?script_id=13
" Press Ctrl+_ to get the active tag autoclosed
:au Filetype html,xml source ~/.vim/closetag/closetag.vim

" AUTOMATIC INDENTATION
"filetype plugin on
"filetype indent on
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(



" NERDTree
" Toggle between showing/hidding NERDTree
map <f2> :NERDTreeToggle<CR>

" COUNT WORDS
" From http://stackoverflow.com/a/116454
let g:word_count="<unknown>"
fun! WordCount()
    return g:word_count
endfun
fun! UpdateWordCount()
    let s = system("wc -w ".expand("%p"))
    let parts = split(s, ' ')
    if len(parts) > 1
        let g:word_count = parts[0]
    endif
endfun

augroup WordCounter
    au! CursorHold * call UpdateWordCount()
    au! CursorHoldI * call UpdateWordCount()
augroup END

" how eager are you? (default is 4000 ms)
set updatetime=500

" modify as you please...
set statusline=%{WordCount()}\ words


" STATUS LINE ON STEROIDS
" https://github.com/vgod/vimrc/blob/master/vimrc
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L/%{WordCount()}

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

" disable markdown folding
let g:vim_markdown_folding_disabled=1

" SYNTAX CHECKER
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Enable the specific ESLint checker for files in mozilla-central/ only.
" Enable the HTML plugin, and enable JavaScript linting for HTML files.
autocmd FileType javascript,html
    \ if stridx(expand("%:p"), "/gecko-hg/") != -1 |
    \    let b:syntastic_checkers = ['eslint'] |
    \    let b:syntastic_eslint_exec = '/Users/sole/data/current/devtools/gecko-hg/node_modules/.bin/eslint' |
    \    let b:syntastic_html_eslint_args = ['--plugin', 'html'] |
    \ endif

" Use Mozilla style when in a mozilla environment
" i.e. when the machine has something like
"
" $MOZILLAENV = 1
" export $MOZILLAENV
"
" in the .bash_profile (or similar) file
function! UseMozillaStyle()

	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set expandtab

	" save 2 spaces in HTML files but display 4 for readability sake
	" src: http://stackoverflow.com/questions/14514336/gvim-show-4-spaces-but-save-2-spaces-tabs
	augroup AdaptIndent
		autocmd!
		autocmd BufReadPost,BufWritePost  *.html %substitute/^ \+/&&/e
		autocmd BufWritePre               *.html %substitute/^\( \+\)\1/\1/e
	augroup END

	autocmd AdaptIndent

endfunction


" Jen gets very angry if I indent JS with 4 spaces instead of 2
" I am afraid of Angry Jen, so I created this function
function! UseJenStyle()

	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
	set expandtab

	augroup AdaptIndent
		autocmd!
	augroup END

endfunction

" To get back to "my" style
function! UseMyStyle()

	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set noexpandtab

	augroup AdaptIndent
		autocmd!
	augroup END

endfunction

let mozillaenv=$MOZILLAENV

if mozillaenv == '1' 
	call UseMozillaStyle()
endif
