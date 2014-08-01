" -*- vim -*-
" ------------------------------------------------------------------------------
" Exit when your app has already been loaded (or "compatible" mode set)
if exists("g:loaded_simplate_vim") || &cp
  finish
endif
let g:loaded_simplate_vim = 1 " simplate.vim version number
let s:keepcpo          = &cpo
set cpo&vim

syntax on
syntax include @Python syntax/python.vim
syntax region pythonCode keepend start=/\%^/ end=/^\[----*\]/re=s-1,he=s-1 contains=@Python
syntax region pythonCode keepend start=/^\[----*\]\s*$/rs=e+1,hs=e+1 end=/^\[----*\]/re=s-1,he=s-1 contains=@Python

" ------------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo
