Spell Loop
==========
Loop over different languages in Vim spell check.


Installation
------------
Copy `plugin/spell-loop.vim` in `~/.vim/plugin`, or use your favorite plugin 
manager.


Usage
-----
The function `SpellLoop()` does all the work.

This is part of my `.vimrc` file:
```vim
let g:spell_list = ["none", "en", "it"]
map <silent> <space>s :call SpellLoop()<CR>
```
If not changed by user `g:spell_list` contains only **en** and **none**.
