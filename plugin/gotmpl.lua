vim.api.nvim_create_user_command("GoTemplateLspInstall", function()
  require("go-template-lsp").install()
end, { desc = "Install go-template-lsp via Mason" })
