local root = vim.fn.getcwd()
vim.opt.runtimepath:prepend(root)
vim.opt.runtimepath:append(root .. "/after")
vim.opt.swapfile = false
vim.opt.backup = false
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
