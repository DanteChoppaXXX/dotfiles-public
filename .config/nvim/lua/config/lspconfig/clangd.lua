local util = require "lspconfig/util"

return {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--offset-encoding=utf-16" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = util.root_pattern("compile_commands.json", ".git"),
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
  },
  on_attach = function(client, bufnr)
    -- Optional: Custom keymaps or commands can go here
  end,
}
