
" Go vim settings

"line length stuff
set colorcolumn=100

" tab stuff
setlocal noexpandtab      " expands tabs to 4 spaces
setlocal autoindent


let g:go_fmt_command = "goimports"

" setup plugin integrations
nmap <Leader>e <Plug>(go-rename)
nmap <leader>t <Plug>(go-test)
nmap <Leader>d <Plug>(go-doc-vertical)

