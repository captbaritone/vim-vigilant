if !exists('g:vigilant_cmd')
    let g:vigilant_cmd = 'nosetests'
endif

command! VigilantRunTests :call s:RunTests()
command! VigilantRunCurrentTests :call s:RunCurrentTests()
command! VigilantRunTestClass :call s:RunTestClass()
command! VigilantRunSingleTest :call s:RunSingleTest()
command! VigilantRerun :call s:Rerun()

" Run all the tests
function! s:RunTests()
    call s:runCommand(g:vigilant_cmd)
endfunction

" Run all the tests in the current file
function! s:RunCurrentTests()
    let l:cmd = g:vigilant_cmd . ' ' .  s:fileName()
    call s:runCommand(l:cmd)
endfunction

" Run the test class that your cursor is within
function! s:RunTestClass()
    let l:cmd = g:vigilant_cmd . ' ' . s:fileName() . ':' . s:pyClassName()
    call s:runCommand(l:cmd)
endfunction

" Run the single test that your cursor is within
function! s:RunSingleTest()
    let l:cmd = g:vigilant_cmd . ' ' . s:fileName() . ':' . s:pyClassName() . '.' .  s:pyFunctionName()
    call s:runCommand(l:cmd)
endfunction

" Rerun your last test command
function! s:Rerun()
    call VimuxRunLastCommand()
endfunction

" Private functions
function! s:fileName()
    return expand('%:p')
endfunction

function! s:runCommand(cmd)
    echo a:cmd
    call VimuxRunCommand(a:cmd)
endfunction


" Written for me by osse in Freenode #vim. Thanks!
function! s:pyClassName()
    let classlineno = search('^class \w\+', 'Wbn')
    if classlineno == 0
        return ''
    endif

    let classline = getline(classlineno)
    let classname = matchstr(classline, 'class \zs\w\+')
    return classname
endfunction

function! s:pyFunctionName()
    let funclineno = search('^\s*def \w\+(', 'Wbn')
    if funclineno == 0
        return ''
    endif

    let funcline = getline(funclineno)
    let funcname = matchstr(funcline, 'def \zs\w\+')
    return funcname
endfunction

