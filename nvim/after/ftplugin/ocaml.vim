
autocmd FileType ocaml source /Users/natebrennand/.opam/system/share/vim/syntax/ocp-indent.vim

let g:syntastic_ocaml_checkers = ['merlin']

set tabstop=2
set shiftwidth=2

nmap <Leader>t :TypeOf<CR>
nmap <Leader>l :Locate<CR>

set wildignore+=*.cmo,*.cmi

