
set nocompatible    "This fixes the problem where arrow keys do not function properly on some systems.
set backspace=2     "This makes the backspace key function like it does in other programs.
set foldmethod=manual  "Lets you hide sections of code
set showcmd     " Shows incomplete commands

" appearance
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set number  "Enables line numbering
set ruler " Shows cursor position
set scrolloff=3 " leaves 3 spaces between top/bottom and cursor
set showmatch "Highlights matching brackets in programming languages

" tabs
set expandtab
set tabstop=4   " Spaces instead of tabs
set shiftwidth=4
set smarttab  "Improves tabbing
set shiftwidth=4  "Assists code formatting

" searching
set hlsearch    " highlight search matches
set incsearch   " searches as you type

" indenting
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages

" colors
syntax on           "Enables syntax highlighting for programming languages
if $TERM =~ '256color'
    set t_Co=256
elseif $TERM =~ '^xterm$'
    set t_Co=256
endif
colorscheme molokai " colors!
au BufRead,BufNewFile *.md set filetype=markdown    " markdown syntax for non-README files

" use filetype specific vim settings
" settings located in ~/.vim/after/ftplugins/
filetype plugin on

"key remappings 

" commands
" don't use shift when save/quit/etc ; --> : (in command mode)
noremap ; :

" windows
" rmap s to ctrl-W
noremap s <C-W>

