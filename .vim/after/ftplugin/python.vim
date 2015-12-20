
" Python vim settings

"line length stuff
set colorcolumn=81

" tab stuff
setlocal expandtab      " expands tabs to 4 spaces
setlocal autoindent
set shiftwidth=2

let g:syntastic_python_checkers=['pyflakes']

set wildignore+=*.pyc

