local t = require("tests.helpers")

print("test_ftplugin")

local buf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_set_current_buf(buf)
vim.bo[buf].filetype = "gotmpl"

t.eq("commentstring", vim.bo[buf].commentstring, "{{/* %s */}}")
t.eq("comments", vim.bo[buf].comments, "s:{{/*,e:*/}}")
t.ok("iskeyword contains dot", vim.bo[buf].iskeyword:find("%.") ~= nil)
t.ok("iskeyword contains dollar", vim.bo[buf].iskeyword:find("%$") ~= nil)

vim.api.nvim_buf_delete(buf, { force = true })

t.summary()
