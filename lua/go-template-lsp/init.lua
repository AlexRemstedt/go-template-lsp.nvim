local M = {}

M.defaults = {
  filetypes = { "gotmpl" },
  cmd = { "go-template-lsp" },
  root_markers = { "go.mod", ".git" },
  settings = {},
  on_attach = nil,
  mason = true,
}

local function resolve_cmd(opts)
  if not opts.mason then
    return opts.cmd
  end

  local ok, registry = pcall(require, "mason-registry")
  if not ok then
    return opts.cmd
  end

  local pkg_name = "go-template-lsp"
  if registry.is_installed(pkg_name) then
    local pkg = registry.get_package(pkg_name)
    local bin = pkg:get_install_path() .. "/go-template-lsp"
    return { bin }
  end

  return opts.cmd
end

function M.setup(opts)
  opts = vim.tbl_deep_extend("force", M.defaults, opts or {})

  local cmd = resolve_cmd(opts)

  local lspconfig = require("lspconfig")
  local configs = require("lspconfig.configs")

  if not configs.go_template_lsp then
    configs.go_template_lsp = {
      default_config = {
        cmd = cmd,
        filetypes = opts.filetypes,
        root_dir = lspconfig.util.root_pattern(unpack(opts.root_markers)),
        settings = opts.settings,
      },
    }
  end

  lspconfig.go_template_lsp.setup({
    on_attach = opts.on_attach,
    settings = opts.settings,
  })

  vim.schedule(function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == "gotmpl" then
        vim.api.nvim_exec_autocmds("FileType", { buffer = buf, pattern = "gotmpl" })
      end
    end
  end)
end

function M.install(callback)
  local ok, registry = pcall(require, "mason-registry")
  if not ok then
    vim.notify("mason.nvim is required for :GoTemplateLspInstall", vim.log.levels.ERROR)
    return
  end

  local pkg_name = "go-template-lsp"
  if registry.is_installed(pkg_name) then
    vim.notify("go-template-lsp is already installed", vim.log.levels.INFO)
    if callback then callback() end
    return
  end

  local pkg = registry.get_package(pkg_name)
  vim.notify("Installing go-template-lsp...", vim.log.levels.INFO)
  pkg:install():once("closed", vim.schedule_wrap(function()
    if pkg:is_installed() then
      vim.notify("go-template-lsp installed successfully", vim.log.levels.INFO)
    else
      vim.notify("go-template-lsp installation failed", vim.log.levels.ERROR)
    end
    if callback then callback() end
  end))
end

return M
