Spell Loop
==========
Loop over different languages in Vim spell check


Installation
------------
Copy `plugin/spell-loop.vim` in `~/.vim/plugin`, or use your favorite plugin 
manager.


Usage
-----
This is part of my `.vimrc` file:
```vim
let g:spell_list = ["none", "en", "it"]
map <silent> <space>s :call SpellLoop()<CR>
```
By default `g:spell_list` contains only **en** and **none**.
