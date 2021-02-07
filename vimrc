"Setting Syntax Highlighting
syntax on
"set termguicolors
" SETTING MAP LEADER
:let mapleader = " "

"set termguicolors

let $BASH_ENV="~/.bashrc"

set winaltkeys=no
let s:printable_ascii = map(range(32, 126), 'nr2char(v:val)')
call remove(s:printable_ascii, 92)
for s:char in s:printable_ascii
  execute "imap <A-" . s:char . "> <Esc>" . s:char
  execute "nmap <A-" . s:char . "> <Esc>" . s:char
endfor
unlet s:printable_ascii s:char

" Setting Tab Size
set tabstop=4
set shiftwidth=4

" FIXING BACKSPACE BEHAVIOR
:set backspace=indent,eol,start

" FOLDING FUNCTIONS
set foldmethod=syntax

" PLUGIN MANAGER
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/SimpylFold'
Plug 'ziglang/zig.vim'

call plug#end()

" SETTING COLOR
set background=dark
highlight Normal ctermfg=15
highlight Comment ctermfg=7
highlight Function ctermfg=12
highlight Statement ctermfg=10

" SETTING AUTO INDENT
filetype plugin indent on

" VIMRC QUICK EDITTING
command Editvim execute ":split $MYVIMRC"
command Loadvim execute ":source $MYVIMRC"
:nnoremap <leader>ev :Editvim<cr>
:nnoremap <leader>sv :Loadvim<cr>

" SPLIT RESIZING
command IncreaseSplitSize execute ":res +5"
command DecreaseSplitSize execute ":res -5"
command IncreaseVSplitSize execute ":vertical resize +5"
command DecreaseVSplitSize execute ":vertical resize -5"

:noremap <leader>s= :IncreaseSplitSize<cr>
:noremap <leader>s- :DecreaseSplitSize<cr>
:noremap <leader>s] :IncreaseVSplitSize<cr>
:noremap <leader>s[ :DecreaseVSplitSize<cr>

" SWITCHING TABS
:noremap <C-k> :tabnext<cr>
:noremap <C-j> :tabprevious<cr>
:noremap <C-n> :tabnew<cr>
