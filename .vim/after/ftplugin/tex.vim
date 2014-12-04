
" latex vim settings

set autoindent
set expandtab     " uses spaces, not tabs
set tabstop=2
set shiftwidth=2

" this allows "_" to be used outside of math
" clear the current list of matches that cause error-highlighting
syn clear texOnlyMath
" " still mark '^' as an error outside of math mode
syn match texOnlyMath /[\^]/

set synmaxcol=1000                   " stop highlighting after 1000 characters

