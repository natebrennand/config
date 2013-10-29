
" random
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

" folding
"set foldmethod=indent   " fold based on indentation
set foldnestmax=5       " deepest fold in 10 levels
set nofoldenable        " don't fold by default
set foldlevel=1

" searching
set hlsearch    " highlight search matches
set incsearch   " searches as you type
set ignorecase  " case insensitive searching
set smartcase   " searches w/ case if there's a capital letter

" indenting
set autoindent  "If you're indented, new lines will also be indented
" set smartindent  "Automatically indents lines after opening a bracket in programming languages

" colors
syntax on           "Enables syntax highlighting for programming languages
if $TERM =~ '256color'
    set t_Co=256
elseif $TERM =~ '^xterm$'
    set t_Co=256
endif

" color choices
" colorscheme molokai
" colorscheme ir_black
set background=dark
colorscheme jellybeans              " jellybean colors!
let g:jellbeans_use_color_black = 0 " use the right black
set synmaxcol=200                   " stop highlighting after 200 characters

" markdown syntax
au BufRead,BufNewFile *.md set filetype=markdown
" golang syntax
au BufRead,BufNewFile *.go set filetype=go
" coffee syntax
au BufRead,BufNewFile *.coffee set filetype=coffee
" less syntax
au BufRead,BufNewFile *.less set filetype=less

" Vundle setup
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/syntastic'
Bundle 'mutewinter/nginx.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-coffee-script'
Bundle 'vim-less'
Bundle 'vim-indent-guides'

" Airline
Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Nerd Tree
Bundle 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

" Ctrl - P
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" use filetype specific vim settings
" settings located in ~/.vim/after/ftplugin/
filetype indent plugin on

" show cursor position
set cursorline

" window stuff
set winwidth=80     " default to a width of 80 columns
no equalalways


"key remappings 
" commands: don't use shift when save/quit/etc ; --> : (in command mode)
noremap ; :
" windows: rmap s to ctrl-W
noremap s <C-W>
" navigation: move by displayed lines, not real lines
noremap j gj
noremap k gk

" clipboard stuff

" vmap <C-x> :!pbcopy<CR>         " cut
vmap <C-C> :w !pbcopy<CR><CR>   " copy


