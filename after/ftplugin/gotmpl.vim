if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal commentstring={{/*\ %s\ */}}
setlocal comments=s:{{/*,e:*/}}

setlocal iskeyword+=.,$

" matchit support for template blocks
if exists("loaded_matchit")
  let b:match_words = '{{-\?\s*if\>:{{-\?\s*else\>:{{-\?\s*end\>,'
        \ . '{{-\?\s*range\>:{{-\?\s*else\>:{{-\?\s*end\>,'
        \ . '{{-\?\s*with\>:{{-\?\s*else\>:{{-\?\s*end\>,'
        \ . '{{-\?\s*block\>:{{-\?\s*end\>,'
        \ . '{{-\?\s*define\>:{{-\?\s*end\>}'
endif

let b:undo_ftplugin = "setlocal commentstring< comments< iskeyword<"
      \ . "| unlet! b:match_words"
