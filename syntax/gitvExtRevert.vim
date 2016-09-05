if exists("b:current_syntax")
    finish
endif

syn match gitvExtReversion '^\[.\{-}\]'
hi def link gitvExtReversion gitvHash

syn match gitvExtError '^\(error\|fatal\):.*'
hi def link gitvExtError ErrorMsg

syn match gitvExtHint '^hint:.*'
hi def link gitvExtHint Statement

syn match gitvExtChanges '^\s\+[0-9]\+\s\+files\? changed\(.*insertions\?\)\?\(.*deletions\?.*\)\?'
hi def link gitvExtChanges Type

let b:current_syntax = "gitvrevert"
