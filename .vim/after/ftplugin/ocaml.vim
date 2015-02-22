
autocmd FileType ocaml source /Users/natebrennand/.opam/system/share/vim/syntax/ocp-indent.vim

let g:syntastic_ocaml_checkers = ['merlin']

nmap <Leader>t :TypeOf<CR>
nmap <Leader>l :Locate<CR>

set wildignore+=*.cmo,*.cmi

