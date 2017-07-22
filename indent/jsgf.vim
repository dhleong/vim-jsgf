" Vim indent file
" Language: JSpeech Grammar Format
" Maintainer: Daniel Leong
" Latest Revision: 22 July 2017

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetJSGFIndent()
setlocal indentkeys=0},0),!^F,o,O,e,<CR>
setlocal autoindent " TODO ?

function! GetJSGFIndent()
    if v:lnum == 0
        return 0
    endif

    let prevNum = prevnonblank(v:lnum - 1)
    let prev = getline(prevNum)

    echom prev

    let candidates = ['=', '|', '(', '[']

    let search = ''
    for candidate in candidates
        let match = '\v^([[:blank:]]|(public[[:blank:]]+)*\<[^>]+\>[[:blank:]])*\' . candidate
        if prev =~# match
            let search = candidate
            break
        endif
    endfor

    if search == ''
        return indent(prevNum)
    endif

    return stridx(prev, search)
endfunction
