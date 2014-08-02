" -*- vim -*-
" ------------------------------------------------------------------------------
" Exit when your app has already been loaded (or "compatible" mode set)
if exists("g:loaded_simplate_vim") || &cp
  finish
endif
let g:loaded_simplate_vim = 1 " simplate.vim version number
let s:keepcpo          = &cpo
set cpo&vim

" Note that the next two functions are modifications of TextEnableCodeSnip from
" http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
" ------------------------------------------------------------------------------

" This sets the language used in the initial sections to the specified filetype
function! SyntaxEnableLanguage(filesyntax) abort
  let ft=toupper(a:filesyntax)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filesyntax.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filesyntax.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ start="\%^" start="^\[----*\]\s*$"rs=e+1,hs=e+1,ms=e+1 
  \ end="^\[----*\]"re=s-1,he=s-1,me=s-1 keepend
  \ contains=@'.group
endfunction

" This enables sections identified by the specified contenttype to be
" hilighted as if they're the specified filesyntax
" Note that contenttype is actually a pattern
function! SyntaxEnableTemplate(filesyntax,contenttype) abort
  let ft=toupper(a:filesyntax)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filesyntax.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filesyntax.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ start="^\[----*\].*\c'.a:contenttype.'.*$"rs=e+1,hs=e+1,ms=e+1
  \ end="^\[----*\]"re=s-1,he=s-1,me=s-1 keepend
  \ contains=@'.group
endfunction


syntax on

" only one language at a time is currently supported
call SyntaxEnableLanguage( 'python' )

call SyntaxEnableTemplate( 'html', 'text/html' )
call SyntaxEnableTemplate( 'css', 'text/css' )
call SyntaxEnableTemplate( 'javascript', 'application/javascript' )

" rfc 2376
call SyntaxEnableTemplate( 'xml', 'text/xml' )
call SyntaxEnableTemplate( 'xml', 'application/xml' )
call SyntaxEnableTemplate( 'xml', '.*/.*+xml' )

"" Not in the standard vim distro:

" call SyntaxEnableTemplate( 'json', 'application/json' )

" ------------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo
