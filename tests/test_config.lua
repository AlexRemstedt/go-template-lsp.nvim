local t = require("tests.helpers")

print("test_config")

local M = require("go-template-lsp")

t.ok("defaults is a table", type(M.defaults) == "table")
t.eq("default cmd", M.defaults.cmd[1], "go-template-lsp")
t.eq("default filetype", M.defaults.filetypes[1], "gotmpl")
t.ok("default root_markers contains go.mod", vim.tbl_contains(M.defaults.root_markers, "go.mod"))
t.ok("default root_markers contains .git", vim.tbl_contains(M.defaults.root_markers, ".git"))
t.eq("default mason", M.defaults.mason, true)
t.eq("default on_attach", M.defaults.on_attach, nil)
t.ok("setup is a function", type(M.setup) == "function")
t.ok("install is a function", type(M.install) == "function")

t.summary()
