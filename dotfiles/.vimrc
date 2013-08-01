set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
syntax on  "Enables syntax highlighting for programming languages
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set number  "Enables line numbering
set smarttab  "Improves tabbing
set shiftwidth=4  "Assists code formatting
set foldmethod=manual  "Lets you hide sections of code
set tabstop=4   " Spaces instead of tabs
set shiftwidth=4    "test
set expandtab
set ruler " Shows cursor position
set scrolloff=3 " leaves 3 spaces between top/bottom and cursor

if $TERM =~ '256color'
    set t_Co=256
elseif $TERM =~ '^xterm$'
    set t_Co=256
endif
colorscheme molakai " colors!

set incsearch
set showcmd     " Shows incomplete commands

au BufRead,BufNewFile *.md set filetype=markdown    " markdown syntax for non-README files

" use filetype specific vim settings
" settings located in ~/.vim/after/ftplugins/
filetype plugin on

