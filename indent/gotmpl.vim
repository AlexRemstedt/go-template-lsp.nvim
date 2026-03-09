if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GotmplIndent()
setlocal indentkeys=o,O,!^F,0},0),0],={{end,={{else

let b:undo_indent = "setlocal indentexpr< indentkeys<"

if exists("*GotmplIndent")
  finish
endif

function! GotmplIndent()
  let lnum = prevnonblank(v:lnum - 1)
  if lnum == 0
    return 0
  endif

  let ind = indent(lnum)
  let prev = getline(lnum)
  let cur = getline(v:lnum)

  " Increase indent after opening blocks
  if prev =~# '{{-\?\s*\(if\|range\|with\|block\|define\)\>'
    let ind += shiftwidth()
  endif

  " Decrease indent for closing/transition keywords
  if cur =~# '{{-\?\s*end\>'
    let ind -= shiftwidth()
  endif

  if cur =~# '{{-\?\s*else\>'
    let ind -= shiftwidth()
  endif

  return ind < 0 ? 0 : ind
endfunction
