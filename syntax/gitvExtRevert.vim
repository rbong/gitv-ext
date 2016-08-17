syn match gitvExtReversion '^\[.\{-}\]'
hi def link gitvExtReversion gitvHash

syn match gitvExtError '^\(error\|fatal\):.*'
hi def link gitvExtError ErrorMsg

syn match gitvExtHint '^hint:.*'
hi def link gitvExtHint Statement

syn match gitvExtChanges '.*files changed.*insertions.*deletions.*'
hi def link gitvExtChanges Type
