set showmode
set showcmd
set autoindent
set hlsearch
set showmatch

" SET FONT FACE (WORKS ON THE GUI ONLY)
" http://www.levien.com/type/myfonts/inconsolata.html
:set guifont=Inconsolata

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" LINE NUMBERS
set number

" REMAP CONTROL+V AND CONTROL+C TO PASTE AND COPY RESPECTIVELY
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" AUTOCOMPLETE (didn't work properly...)
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete

" AUTOMATIC INDENTATION
filetype plugin on
filetype indent on
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" SUPER RETAB
" For converting indented spaces to tabs
" To use: visually select block, then enter Tab2Space or Space2Tab as commands
" Source: http://vim.wikia.com/wiki/Super_retab
:command! -range=% -nargs=0 Tab2Space execute "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
:command! -range=% -nargs=0 Space2Tab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"


" NERDTree
" Toggle between showing/hidding NERDTree
map <f2> :NERDTreeToggle<CR>

" STATUS LINE ON STEROIDS
" https://github.com/vgod/vimrc/blob/master/vimrc
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

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
