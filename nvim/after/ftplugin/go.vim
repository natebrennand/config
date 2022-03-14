
" Go vim settings

autocmd BufWritePre lua goimports(500)

"line length stuff
set colorcolumn=100

" tab stuff
setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab      " expands tabs to 4 spaces
setlocal autoindent
setlocal softtabstop=0

setlocal foldmethod=syntax

" setup plugin integrations
nmap <Leader>e <Plug>(go-rename)
nmap <leader>t <Plug>(go-test)
nmap <Leader>d <Plug>(go-doc-vertical)

