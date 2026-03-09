local M = {}

function M.check()
  vim.health.start("go-template-lsp")

  if vim.fn.executable("go-template-lsp") == 1 then
    vim.health.ok("go-template-lsp binary found")
  else
    vim.health.error("go-template-lsp binary not found", {
      "Install via Mason: :MasonInstall go-template-lsp",
      "Or build from https://github.com/Allseas/go-template-lsp",
    })
  end

  local ok, _ = pcall(require, "lspconfig")
  if ok then
    vim.health.ok("nvim-lspconfig is installed")
  else
    vim.health.error("nvim-lspconfig is not installed")
  end

  local mason_ok, _ = pcall(require, "mason")
  if mason_ok then
    vim.health.ok("mason.nvim is installed")
  else
    vim.health.info("mason.nvim is not installed (optional)")
  end
end

return M
