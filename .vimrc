
" Nate Brennand

" Enables syntax highlighting for programming languages
syntax on
if !has('nvim')
    set nocompatible
    set ttyfast " u got a fast terminal
endif

if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif

" Vundle setup
filetype off

let g:python2_host_prog='/usr/local/opt/python/libexec/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'

let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim'
call vundle#begin(s:editor_root . '/bundle')


Plugin 'gmarik/Vundle.vim'

" Plugins
" git status reminder
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow

" various highlighters
Plugin 'vim-coffee-script'
Plugin 'vim-less'
Plugin 'mutewinter/nginx.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'rust-lang/rust.vim'

" Typescript
" Plugin 'leafgarland/typescript-vim'
" Plugin 'Quramy/tsuquyomi'
" Plugin 'Shougo/vimproc.vim' " dependency of 'Quramy/tsuquyomi'
" let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = ''
" let g:tsuquyomi_disable_quickfix = 1

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

" Ruby
Plugin 'vim-ruby/vim-ruby'

" go stuff
" Plugin 'mdempsky/gocode', {'rtp': 'nvim/'}
Plugin 'fatih/vim-go'
let g:go_def_mode = "gopls"
let g:go_fmt_command = "goimports"

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0


" autcompletion via language servers
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=600
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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

" Ale - Was not ready when I tried it on 10/18/2017
" Plugin 'w0rp/ale'
" let g:ale_linters = {
" \   'go': ['go build', 'golint', 'go vet'],
" \}
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \}
" " Enable completion where available.
" let g:ale_completion_enabled = 1
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1


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
let g:syntastic_html_checkers = []


let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active' }

" FZF
Plugin 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
map <C-p> :Files<CR>
map <C-g> :Ag<CR>


" Ctrl - P
" Plugin 'ctrlpvim/ctrlp.vim'
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:40,results:40'
" let g:ctrlp_max_files = 0
" let g:ctrlp_max_depth = 100

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
set number         " Enables line numbering
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
" autocmd BufRead,BufNewFile *.md setlocal spell
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
" skylark is like Python
au BufRead,BufNewFile *.sky set filetype=python

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
autocmd InsertEnter * highlight CursorLine guibg=red guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=red guifg=fg



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
" set listchars=tab:>-,trail:█,extends:>,precedes:-
" set list

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
