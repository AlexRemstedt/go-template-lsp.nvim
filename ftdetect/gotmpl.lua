vim.filetype.add({
  extension = {
    tmpl = "gotmpl",
  },
  pattern = {
    ["*.go.tmpl"] = "gotmpl",
    ["*.html.tmpl"] = "gotmpl",
    ["*.yaml.tmpl"] = "gotmpl",
    ["*.yml.tmpl"] = "gotmpl",
    ["*.json.tmpl"] = "gotmpl",
    ["*.txt.tmpl"] = "gotmpl",
    ["*.tpl"] = "gotmpl",
  },
})
