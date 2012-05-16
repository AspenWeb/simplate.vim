" -*- vim -*-
unlet b:current_syntax
syntax include @Python syntax/python.vim
syntax region pythonCode start=// end=// contains=@Python

