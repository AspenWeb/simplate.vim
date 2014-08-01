simplate.vim
============

VIM support for syntax hilighting simplates

Warning! We override the default syntax hilighting for `.spt` files, which are 
typically [SNOBOL4](http://www.snobol4.org/)


Related solutions
-----------------

 * fix vim hilighting with [jekyll](http://www.codeography.com/2010/02/20/making-vim-play-nice-with-jekylls-yaml-front-matter.html) (yaml + markdown)


Workaround
----------

I don't know of anyone using this plugin yet. The workaround right now is to manually 
do `:set filetype=python` or `:set filetype=html` as needed. You can set a default for 
the `.spt` extension with this in your `.vimrc`:

```
au BufNewFile,BufRead *.spt setlocal filetype=python
```

