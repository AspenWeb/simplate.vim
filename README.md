aspen.vim
=========

VIM support for the Aspen web framework written in Python


Workaround
----------

I don't know of anyone using this plugin yet. The workaround right now is to manually 
do `:set filetype=python` or `:set filetype=html` as needed. You can set a default for 
the `.spt` extension with this in your `.vimrc`:

```
au BufNewFile,BufRead *.spt setlocal filetype=python
```

(The default in my Vim for `.spt` is [SNOBOL4](http://www.snobol4.org/)).
