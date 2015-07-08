if !exists('g:spell_list')
    let g:spell_list = ["none", "en"]
endif

let s:spell_i = 0

function! SpellLoop()
    let s:spell_i = (s:spell_i + 1) % len(g:spell_list)
    let l:spell = g:spell_list[s:spell_i]

    if l:spell == "none"
        setlocal spell!
    else
        exec "setlocal spell spelllang=" . l:spell
    endif

    echo "spell check: " . l:spell
endfunction
