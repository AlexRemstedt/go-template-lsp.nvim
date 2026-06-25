local t = require("tests.helpers")

print("test_syntax")

local function get_syn_group(buf, row, col)
  local id = vim.fn.synID(row, col, true)
  return vim.fn.synIDattr(id, "name")
end

local function setup_buf(content)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buf)
  local lines = vim.split(content, "\n")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].filetype = "gotmpl"
  vim.cmd("redraw")
  return buf, lines
end

-- Test basic action delimiters
local buf = setup_buf('{{ .Name }}')
t.eq("delimiter opening", get_syn_group(buf, 1, 1), "gotmplDelimiter")
t.eq("delimiter closing", get_syn_group(buf, 1, 10), "gotmplDelimiter")
t.eq("field .Name", get_syn_group(buf, 1, 4), "gotmplField")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test keywords
buf = setup_buf('{{ if .Cond }}')
t.eq("keyword if", get_syn_group(buf, 1, 4), "gotmplKeyword")
vim.api.nvim_buf_delete(buf, { force = true })

buf = setup_buf('{{ range .Items }}')
t.eq("keyword range", get_syn_group(buf, 1, 4), "gotmplKeyword")
vim.api.nvim_buf_delete(buf, { force = true })

buf = setup_buf('{{ end }}')
t.eq("keyword end", get_syn_group(buf, 1, 4), "gotmplKeyword")
vim.api.nvim_buf_delete(buf, { force = true })

buf = setup_buf('{{ else }}')
t.eq("keyword else", get_syn_group(buf, 1, 4), "gotmplKeyword")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test functions
buf = setup_buf('{{ len .List }}')
t.eq("function len", get_syn_group(buf, 1, 4), "gotmplFunction")
vim.api.nvim_buf_delete(buf, { force = true })

buf = setup_buf('{{ default "x" .V }}')
t.eq("function default (sprig)", get_syn_group(buf, 1, 4), "gotmplFunction")
vim.api.nvim_buf_delete(buf, { force = true })

buf = setup_buf('{{ include "tpl" . }}')
t.eq("function include (helm)", get_syn_group(buf, 1, 4), "gotmplFunction")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test variable
buf = setup_buf('{{ $var := .X }}')
t.eq("variable $var", get_syn_group(buf, 1, 4), "gotmplVariable")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test pipe
buf = setup_buf('{{ .X | quote }}')
t.eq("pipe operator", get_syn_group(buf, 1, 7), "gotmplPipe")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test assign operator
buf = setup_buf('{{ $x := 1 }}')
t.eq("assign operator", get_syn_group(buf, 1, 7), "gotmplOperator")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test string
buf = setup_buf('{{ "hello" }}')
t.eq("string", get_syn_group(buf, 1, 5), "gotmplString")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test number
buf = setup_buf('{{ 42 }}')
t.eq("number", get_syn_group(buf, 1, 4), "gotmplNumber")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test bool
buf = setup_buf('{{ true }}')
t.eq("bool true", get_syn_group(buf, 1, 4), "gotmplBool")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test nil
buf = setup_buf('{{ nil }}')
t.eq("nil", get_syn_group(buf, 1, 4), "gotmplNil")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test comment
buf = setup_buf('{{/* comment */}}')
t.eq("comment", get_syn_group(buf, 1, 6), "gotmplComment")
vim.api.nvim_buf_delete(buf, { force = true })

-- Test trimmed whitespace delimiters
buf = setup_buf('{{- .Name -}}')
t.eq("trim delimiter opening", get_syn_group(buf, 1, 1), "gotmplDelimiter")
t.eq("trim field", get_syn_group(buf, 1, 5), "gotmplField")
vim.api.nvim_buf_delete(buf, { force = true })

-- Text outside template actions should have no gotmpl highlight
buf = setup_buf('plain text {{ .X }}')
t.eq("plain text outside action", get_syn_group(buf, 1, 1), "")
vim.api.nvim_buf_delete(buf, { force = true })

t.summary()
