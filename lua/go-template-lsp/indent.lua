local M = {}

function M.get()
  local lnum = vim.fn.prevnonblank(vim.v.lnum - 1)
  if lnum == 0 then
    return 0
  end

  local ind = vim.fn.indent(lnum)
  local prev = vim.fn.getline(lnum)
  local cur = vim.fn.getline(vim.v.lnum)

  if vim.fn.match(prev, [[{{-\?\s*\(if\|range\|with\|block\|define\|else\)\>]]) >= 0 then
    ind = ind + vim.fn.shiftwidth()
  end

  if vim.fn.match(cur, [[{{-\?\s*end\>]]) >= 0 then
    ind = ind - vim.fn.shiftwidth()
  end

  if vim.fn.match(cur, [[{{-\?\s*else\>]]) >= 0 then
    ind = ind - vim.fn.shiftwidth()
  end

  return math.max(0, ind)
end

return M
