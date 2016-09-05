" http://stackoverflow.com/questions/24027506/get-a-vim-scripts-snr
func! s:getScriptNumber(script_name)
    " Return the <SNR> of a script.
    "
    " Args:
    "   script_name : (str) The name of a sourced script.
    "
    " Return:
    "   (int) The <SNR> of the script; if the script isn't found, -1.
    redir => scriptnames
    silent! scriptnames
    redir END
    for script in split(l:scriptnames, "\n")
        if l:script =~ a:script_name
            return str2nr(split(l:script, ":")[0])
        endif
    endfor
    return -1
endfunc

let s:gitvScriptNum=s:getScriptNumber("gitv")

func! gitv#call(func)
  return eval(printf("<SNR>%d_" . a:func, s:gitvScriptNum))
endfunc

func! gitv#get_sha()
  return gitv#call("GetGitvSha('.')")
endfunc

func! s:OpenGitCommand(func, filetype)
  silent let res = Gitv_OpenGitCommand(a:func, "20new")
  if res
    exec "silent set filetype=" . a:filetype
  endif
endfunc

func! s:GitvRevert()
  call s:OpenGitCommand("revert " . gitv#get_sha(), "gitvrevert")
endfunc

nnoremap <buffer> <silent> ]r :call gitv#call("JumpToRef(0)")<cr>
nnoremap <buffer> <silent> [r :call gitv#call("JumpToRef(1)")<cr>
nnoremap <buffer> <silent> rev :call <SID>GitvRevert()<CR>
