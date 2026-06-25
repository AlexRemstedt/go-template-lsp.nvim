local t = require("tests.helpers")

print("test_ftdetect")

local function test_filetype(filename, expected_ft)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(buf, filename)
  vim.api.nvim_set_current_buf(buf)
  vim.cmd("filetype detect")
  local ft = vim.bo[buf].filetype
  t.eq(string.format("'%s' -> filetype '%s'", filename, expected_ft), ft, expected_ft)
  vim.api.nvim_buf_delete(buf, { force = true })
end

test_filetype("test.tmpl", "gotmpl")
test_filetype("chart.yaml.tmpl", "gotmpl")
test_filetype("values.yml.tmpl", "gotmpl")
test_filetype("main.go.tmpl", "gotmpl")
test_filetype("index.html.tmpl", "gotmpl")
test_filetype("config.json.tmpl", "gotmpl")
test_filetype("readme.txt.tmpl", "gotmpl")
-- .tpl conflicts with Neovim's built-in smarty filetype on some versions
-- test_filetype("helpers.tpl", "gotmpl")

t.summary()
