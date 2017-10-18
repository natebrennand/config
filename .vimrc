
" Nate Brennand

syntax on           "Enables syntax highlighting for programming languages
if !has('nvim')
    set nocompatible
    set ttyfast " u got a fast terminal

    " colors
" "    if $TERM =~ '256color'
" "        set t_Co=256
" "    elseif $TERM =~ '^xterm$'
" "        set t_Co=256
" "    endif
endif

if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif

" Vundle setup
filetype off

let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim'
call vundle#begin(s:editor_root . '/bundle')


Plugin 'gmarik/Vundle.vim'

" Plugins
" git status reminder
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow

" best thing since sliced bread
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'fs': 1
      \}

" various highlighters
Plugin 'vim-coffee-script'
Plugin 'vim-less'
Plugin 'mutewinter/nginx.vim'
Plugin 'digitaltoad/vim-jade'

" Typescript
Plugin 'leafgarland/typescript-vim'
" Plugin 'Quramy/tsuquyomi'
" Plugin 'Shougo/vimproc.vim' " dependency of 'Quramy/tsuquyomi'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:tsuquyomi_disable_quickfix = 1

" f sharp
Plugin 'fsharp/vim-fsharp'
let g:fsharp_helptext_comments = 1
let g:fsharpbinding_debug = 1
Plugin 'OmniSharp/omnisharp-vim'

" let g:tsuquyomi_disable_quickfix = 1
" autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

let s:lcd = fnameescape(getcwd())
silent! exec "lcd" expand('%:p:h')
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
exec "lcd" s:lcd
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_typescript_tslint_exe = '$(npm bin)/tslint'
let g:syntastic_typescript_tsc_fname = ''

" lotsa colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'tangphillip/SunburstVIM'

" go stuff
Plugin 'fatih/vim-go'
let g:go_hightlight_functions = 1
let g:go_hightlight_methods = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
" add some shortcuts for useful commands
autocmd FileType go nmap <Leader>e <Plug>(go-rename)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>d <Plug>(go-doc-vertical)
autocmd FileType go nmap <Leader>b <Plug>(go-build)

map <C-j> :lnext<CR>
map <C-k> :lprevious<CR>
noremap <leader>a :cclose<CR>

map <C-j> :lnext<CR>
map <C-k> :lprevious<CR>
nnoremap <leader>a :cclose<CR>

" docker
Plugin 'ekalinin/Dockerfile.vim'

" fucking scala
Plugin 'derekwyatt/vim-scala'

" thrift...
Bundle 'solarnz/thrift.vim'

" Reason ML
Bundle 'reasonml-editor/vim-reason'
let g:vimreason_extra_args_expr_reason = '"--print-width 90"'

" LISP
" rainbow parens
Plugin 'oblitum/rainbow'
au FileType c,cpp,clj,go,python call rainbow#load()
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
" clojure
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'


" Autoclosing parens
Plugin 'Raimondi/delimitMate'

" slime replacement
Plugin 'kovisoft/slimv'
let g:paredit_mode=0

" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
set laststatus=2

" Nerd Tree
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

" Syntastic
Plugin 'vim-syntastic/syntastic'
let g:syntastic_aggregate_errors = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_c_check_header = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E111 --max-line-length 100'
let g:syntastic_typescript_checkers=['tsc', 'tslint']
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active' }

" Ctrl - P
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:40,results:40'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,*.db,*.pdf
set wildignore+=*.cmo,*.cmi                 " ocaml
set wildignore+=*.pyc                       " Python
set wildignore+=*.min.js,*/jsmin/*          " JS
set wildignore+=*.fls,*.aux,*.fdb_latexmk   " latex
set wildignore+=*.class,*.jar,*.sbt         " Java / Scala
set wildignore+=*.o                         " C
set wildignore+=*Godeps*                    " Go


call vundle#end()

" #############################
" end of plugins
" #############################

" random
set backspace=2         " This makes the backspace key function like it does in other programs.
set foldmethod=manual   " Lets you hide sections of code
set showcmd             " Shows incomplete commands

" appearance
set relativenumber " Enables relative line numbering
set ruler          " Shows cursor position in bottom bar
set scrolloff=4    " leaves 4 lines between top/bottom and cursor
set showmatch      " Highlights matching brackets in programming languages

" tabs
set expandtab
set tabstop=4       " Spaces instead of tabs
set smarttab        " Improves tabbing
set shiftwidth=4    " Assists code formatting

" folding
set foldnestmax=5       " deepest fold in 10 levels
set nofoldenable        " don't fold by default
set foldlevel=1

" searching
set hlsearch    " highlight search matches
set incsearch   " searches as you type
set ignorecase  " case insensitive searching
set smartcase   " searches w/ case if there's a capital letter
"
" redraw clears highlights at the same time
nnoremap <C-L> :nohl<CR><C-L>

" indenting
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages


" color choices [ zephyr jellybeans ]
set background=dark
" colorscheme sunburst
highlight Normal guibg=black guifg=white
colorscheme monokain
" set synmaxcol=200                   " stop highlighting after 200 characters

" text
au BufRead,BufNewFile *.txt setfiletype=text
" markdown syntax
au BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal spell
" coffee syntax
au BufRead,BufNewFile *.coffee set filetype=coffee
" less syntax
au BufRead,BufNewFile *.less set filetype=less
" golang stuff
au BufRead,BufNewFile *.go set filetype=go
" ocaml
au BufRead,BufNewFile *.ml,*.mli set filetype=ocaml
" reason
au BufRead,BufNewFile *.re set filetype=reason

" use ruby syntax in Vagrantfiles
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" ocaml plugin stuff
" if system("which opam")
"     let g:opamshare = substitute(system('opam config var share'),'\n$','','')
"     execute "set rtp+=" . g:opamshare . "/merlin/vim"
"     execute "set rtp+=" . g:opamshare . "/merlin/vimbufsync"
"     set rtp+=/usr/local/share/ocamlmerlin/vim
" endif

if executable('ocamlmerlin')
  let g:opamshare = substitute(system('opam config var share'),'\n$','','')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
  execute "set rtp+=" . g:opamshare . "/merlin/vimbufsync"
  let g:syntastic_ocaml_checkers=['merlin']
endif
if executable('refmt')
  let g:opamshare = substitute(system('opam config var share'),'\n$','','')
  execute "set rtp+=" . g:opamshare . "/reason/editorSupport/VimReason"
  let g:syntastic_reason_checkers=['merlin']
endif

" webpack nonsense
set backupcopy=yes

" use filetype specific vim settings, settings located in ~/.vim/after/ftplugin/
filetype indent plugin on

" show cursor position
set cursorline

" window stuff
set winwidth=80     " default to a width of 80 columns

" toggle pasting with f11
set pastetoggle=<F11>

" key remappings
" commands: don't use shift when save/quit/etc ";" --> ":" (in command mode)
noremap ; :
" windows: rmap s to ctrl-W
noremap s <C-W>
" navigation: move by displayed lines, not real lines
noremap j gj
noremap k gk

" clipboard stuff
" copying
vmap <C-C> :w !pbcopy<CR><CR>

" spell check w/ f5
map <F5> :setlocal spell! spelllang=en_us<CR>

" remapping the leader key to comma
let mapleader = ","

" adding special characters
set listchars=tab:>-,trail:█,extends:>,precedes:-
set list

" making vim run fast
set lazyredraw " to avoid scrolling problems

" folding
set foldmethod=indent " fold based off of indentation
" toggle folds using the space bar
nnoremap <Space> za


function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
