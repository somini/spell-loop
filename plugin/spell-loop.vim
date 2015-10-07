if !exists('g:spell_list') || empty(g:spell_list)
    let g:spell_list = ["none", "en"]
endif

function! SpellLoop()
    if exists('g:spellloop_skip_nospell') && g:spellloop_skip_nospell && !&spell
        " If this option is set, ignore calls where spell is not set
        return
    endif
    let l:old_idx = <SID>SpellGet()
    if &spell == 0 || l:old_idx == -1
        " Another language set or spell is disabled
        " Go back to the first one
        call SpellLoop_Init()
    else
        call <SID>SpellSet((l:old_idx + 1) % len(g:spell_list))
    endif
    call <SID>SpellAutocmd()
endfunction

function! SpellLoop_Init()
    if &buftype ==# '' " Skip non-file buffers
        " Set the current language to the first in the list
        call s:SpellSet(0)
    endif
    call <SID>SpellAutocmd()
endfunction

function! SpellLoop_ToggleSpell()
    setlocal invspell
    call <SID>SpellAutocmd()
endfunction

function! s:SpellGet()
    return index(g:spell_list,&spelllang)
endfunction

function! s:SpellSet(num)
    let l:spell = g:spell_list[a:num]

    if l:spell == "none"
        setlocal nospell
    else
        exec "setlocal spell spelllang=" . l:spell
    endif

    if !exists('g:spellloop_quiet') || !g:spellloop_quiet
        echo "Current Spelling Language: " . l:spell
    endif
endfunction

function! s:SpellAutocmd()
    if exists('#User#SpellingLanguageChange')
        doautocmd User SpellingLanguageChange
    endif
endfunction
