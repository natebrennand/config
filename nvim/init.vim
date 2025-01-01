
lua require('setup')

" reloads the neovim config
command ReloadConfig :source $MYVIMRC

set completeopt=menu,menuone,noselect

" key remappings
" commands: don't use shift when save/quit/etc ";" --> ":" (in command mode)
noremap ; :
" windows: rmap s to ctrl-W
noremap s <C-W>
" navigation: move by displayed lines, not real lines
noremap j gj
noremap k gk

syntax on
let g:python2_host_prog='/usr/local/opt/python/libexec/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
set laststatus=2

" rainbow parens
" au FileType c,cpp,clj,go,python call rainbow#load()
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


set rtp+=~/.fzf

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,*.db,*.pdf
set wildignore+=*.cmo,*.cmi                 " ocaml
set wildignore+=*.pyc                       " Python
set wildignore+=*.min.js,*/jsmin/*          " JS
set wildignore+=*.fls,*.aux,*.fdb_latexmk   " latex
set wildignore+=*.class,*.jar,*.sbt         " Java / Scala
set wildignore+=*.o                         " C

" always show signcolumns
set signcolumn=yes

" folding
set foldnestmax=5       " deepest fold in 10 levels
set nofoldenable        " don't fold by default
set foldlevel=1
set foldmethod=manual   " Lets you hide sections of code

" folding
set foldmethod=indent " fold based off of indentation
" toggle folds using the space bar
" nnoremap <Space> za

set showcmd             " Shows incomplete commands

" indenting
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages

" appearance
set relativenumber " Enables relative line numbering
set number         " Enables line numbering
set ruler          " Shows cursor position in bottom bar
set scrolloff=4    " leaves 4 lines between top/bottom and cursor
set showmatch      " Highlights matching brackets in programming languages

" tabs
set smarttab " Improves tabbing

" searching
set hlsearch    " highlight search matches
set incsearch   " searches as you type
set ignorecase  " case insensitive searching
set smartcase   " searches w/ case if there's a capital letter

" redraw clears highlights at the same time
nnoremap <C-L> :nohl<CR><C-L>

set background=dark
highlight Normal guibg=black guifg=white
colorscheme monokai_pro

filetype indent plugin on

" show cursor position
set cursorline

" clipboard stuff
" copying
vmap <C-C> :w !pbcopy<CR><CR>

" adding special characters
" set listchars=tab:>-,trail:█,extends:>,precedes:-
set listchars=tab:>-,trail:█,extends:>
set listchars=tab:›\ ,extends:»,precedes:‹,nbsp:·,trail:·
set list

function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
