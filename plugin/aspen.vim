" -*- vim -*-
if exists("b:current_syntax")
    unlet b:current_syntax
endif
syntax include @Python syntax/python.vim
syntax region pythonCode start=// end=// contains=@Python

