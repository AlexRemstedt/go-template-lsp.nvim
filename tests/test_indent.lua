local t = require("tests.helpers")

print("test_indent")

local indent = require("go-template-lsp.indent")

vim.opt.shiftwidth = 2

local function test_indent_lines(lines, expected_indents)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buf)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo.shiftwidth = 2

  for i, expected in ipairs(expected_indents) do
    vim.v.lnum = i
    local got = indent.get()
    t.eq(string.format("line %d: '%s' -> indent %d", i, lines[i], expected), got, expected)
  end

  vim.api.nvim_buf_delete(buf, { force = true })
end

test_indent_lines({
  '{{ if .Values.enabled }}',
  '  <p>hello</p>',
  '{{ end }}',
}, { 0, 2, 0 })

test_indent_lines({
  '{{ range .Items }}',
  '  {{ .Name }}',
  '{{ end }}',
}, { 0, 2, 0 })

test_indent_lines({
  '{{ with .Context }}',
  '  inner',
  '{{ end }}',
}, { 0, 2, 0 })

test_indent_lines({
  '{{ define "mytemplate" }}',
  '  content',
  '{{ end }}',
}, { 0, 2, 0 })

test_indent_lines({
  '{{ block "name" . }}',
  '  content',
  '{{ end }}',
}, { 0, 2, 0 })

test_indent_lines({
  '{{ if .A }}',
  '  a',
  '{{ else }}',
  '  b',
  '{{ end }}',
}, { 0, 2, 0, 2, 0 })

test_indent_lines({
  '{{- if .A -}}',
  '  a',
  '{{- end -}}',
}, { 0, 2, 0 })

test_indent_lines({
  '{{ if .A }}',
  '  {{ if .B }}',
  '    nested',
  '  {{ end }}',
  '{{ end }}',
}, { 0, 2, 4, 2, 0 })

test_indent_lines({
  'no template here',
  'still plain',
}, { 0, 0 })

test_indent_lines({
  '{{ .Value }}',
}, { 0 })

t.summary()
