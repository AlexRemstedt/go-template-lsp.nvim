if vim.b.did_ftplugin then
  return
end
vim.b.did_ftplugin = true

vim.opt_local.commentstring = "{{/* %s */}}"
vim.opt_local.comments = "s:{{/*,e:*/}}"
vim.opt_local.iskeyword:append({ ".", "$" })

if vim.g.loaded_matchit then
  vim.b.match_words = table.concat({
    [[{{-\?\s*if\>:{{-\?\s*else\>:{{-\?\s*end\>]],
    [[{{-\?\s*range\>:{{-\?\s*else\>:{{-\?\s*end\>]],
    [[{{-\?\s*with\>:{{-\?\s*else\>:{{-\?\s*end\>]],
    [[{{-\?\s*block\>:{{-\?\s*end\>]],
    [[{{-\?\s*define\>:{{-\?\s*end\>]],
  }, ",")
end

vim.b.undo_ftplugin = "setlocal commentstring< comments< iskeyword< | unlet! b:match_words"
