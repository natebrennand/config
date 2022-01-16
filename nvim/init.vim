
" https://github.com/hrsh7th/nvim-cmp/blob/bce1b2d780c5ec0ff3d919cf83a5325300222801/README.md

" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config/}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin("~/.config/nvim/plugged")

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'


" rainbow parens
Plug 'frazrepo/vim-rainbow'
" Autoclosing parens
Plug 'Raimondi/delimitMate'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'mfussenegger/nvim-lint'

" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" lotsa colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'tangphillip/SunburstVIM'

call plug#end()


lua require('setup')


" reloads the neovim config
command ReloadConfig :source $MYVIMRC

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
" autocmd BufWritePre *.go lua goimports(500)

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

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


set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
map <C-p> :Files<CR>
map <C-g> :Ag<CR>


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
nnoremap <Space> za

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
set expandtab
set tabstop=4       " Spaces instead of tabs
set smarttab        " Improves tabbing
set shiftwidth=4    " Assists code formatting

" searching
set hlsearch    " highlight search matches
set incsearch   " searches as you type
set ignorecase  " case insensitive searching
set smartcase   " searches w/ case if there's a capital letter

" redraw clears highlights at the same time
nnoremap <C-L> :nohl<CR><C-L>

set background=dark
" colorscheme sunburst
highlight Normal guibg=black guifg=white
colorscheme monokain

filetype indent plugin on

" show cursor position
set cursorline
autocmd InsertEnter * highlight CursorLine guibg=red guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=red guifg=fg

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
