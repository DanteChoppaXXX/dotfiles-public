local custom_lsp = require "lspconfig"

local servers = {
  clangd = require "custom.configs.lspconfig.clangd",
}

return {
  config = function()
    local lspconfig = require "lspconfig"

    for name, config in pairs(servers) do
      lspconfig[name].setup(config)
    end
  end,
}
