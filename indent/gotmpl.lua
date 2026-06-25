if vim.b.did_indent then
  return
end
vim.b.did_indent = true

vim.bo.indentexpr = "v:lua.require'go-template-lsp.indent'.get()"
vim.bo.indentkeys = "o,O,!^F,0},0),0],={{end,={{else"

vim.b.undo_indent = "setlocal indentexpr< indentkeys<"
