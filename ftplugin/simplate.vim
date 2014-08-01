" -*- vim -*-
" ------------------------------------------------------------------------------
" Exit when your app has already been loaded (or "compatible" mode set)
"if exists("g:loaded_simplates_vim") || &cp
"  finish
"endif
"let g:loaded_simplates = 1 " simplates.vim version number
"let s:keepcpo          = &cpo
"set cpo&vim

syntax on
syntax include @Python syntax/python.vim
syntax region pythonCode keepend start=/^\[----*\]\s*$/rs=e+1,hs=e+1 end=/^\[----*\]/re=s-1,he=s-1 contains=@Python

" ------------------------------------------------------------------------------
"let &cpo= s:keepcpo
"unlet s:keepcpo
