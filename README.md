# go-template-lsp.nvim

Neovim plugin for [Allseas/go-template-lsp](https://github.com/Allseas/go-template-lsp) — a language server for Go's `text/template`.

## Features

- **Syntax highlighting** for Go template delimiters, keywords, functions, variables, strings, and more
- **Automatic filetype detection** for `.tmpl`, `.tpl`, and compound extensions (`.go.tmpl`, `.html.tmpl`, etc.)
- **LSP integration** via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — diagnostics, completion, hover, go-to-definition, find references
- **Mason integration** — automatic binary installation via [mason.nvim](https://github.com/williamboman/mason.nvim)
- **Indentation** — automatic indent/dedent for `if`/`range`/`with`/`block`/`define`/`end` blocks
- **Commenting** — `gc` / `gcc` support via proper `commentstring` (`{{/* ... */}}`)
- **matchit** — `%` jumps between `if`/`else`/`end`, `range`/`else`/`end`, etc.
- **Folding** — fold on template block boundaries
- **Health check** — `:checkhealth go-template-lsp`

## Requirements

- Neovim >= 0.9
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim) (optional, for automatic installation)
- The `go-template-lsp` binary — install via Mason or build from [Allseas/go-template-lsp](https://github.com/Allseas/go-template-lsp)

## Installation

### lazy.nvim (with Mason)

```lua
{
  "alexremstedt/go-template-lsp.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
  },
  ft = "gotmpl",
  opts = {},
}
```

### lazy.nvim (without Mason)

```lua
{
  "alexremstedt/go-template-lsp.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  ft = "gotmpl",
  opts = { mason = false },
}
```

### Manual

```lua
require("go-template-lsp").setup()
```

## Configuration

All options are optional:

```lua
require("go-template-lsp").setup({
  cmd = { "go-template-lsp" },       -- command to start the server
  filetypes = { "gotmpl" },          -- filetypes to attach to
  root_markers = { "go.mod", ".git" }, -- project root detection
  settings = {},                      -- LSP server settings
  on_attach = nil,                    -- callback after LSP attaches
  mason = true,                      -- use Mason-installed binary if available
})
```

## Commands

| Command | Description |
|---------|-------------|
| `:GoTemplateLspInstall` | Install go-template-lsp binary via Mason |
| `:checkhealth go-template-lsp` | Verify installation and dependencies |

## Detected Filetypes

| Extension | Filetype |
|-----------|----------|
| `*.tmpl` | `gotmpl` |
| `*.tpl` | `gotmpl` |
| `*.go.tmpl` | `gotmpl` |
| `*.html.tmpl` | `gotmpl` |
| `*.yaml.tmpl` / `*.yml.tmpl` | `gotmpl` |
| `*.json.tmpl` | `gotmpl` |
| `*.txt.tmpl` | `gotmpl` |

## Syntax Highlighting

The plugin highlights Go template constructs inside `{{ }}` delimiters:

- **Delimiters** — `{{`, `}}`, `{{-`, `-}}`
- **Keywords** — `if`, `else`, `end`, `range`, `with`, `template`, `block`, `define`
- **Built-in functions** — `and`, `call`, `len`, `print`, `printf`, `eq`, `ne`, `lt`, `gt`, etc.
- **Sprig/Helm functions** — `default`, `toYaml`, `include`, `required`, `tpl`, `lookup`, etc.
- **Variables** — `$`, `$var`
- **Fields** — `.Field`, `.Values.key`
- **Strings, numbers, booleans, nil**
- **Comments** — `{{/* comment */}}`
- **Pipe operator** — `|`

## License

MIT
