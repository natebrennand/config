
" Go vim settings

"line length stuff
set colorcolumn=80

" tab stuff
setlocal noexpandtab      " expands tabs to 4 spaces
setlocal autoindent


autocmd FileType go autocmd BufWritePre <buffer> Fmt
set runtimepath+=$GOROOT/misc/vim

