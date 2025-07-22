local servers = {
  -- other servers
  "clangd",
}

local custom_configs = require("configs") -- <-- this should be your folder

for _, server in ipairs(servers) do
  local opts = custom_configs[server] or {}
  lspconfig[server].setup(opts)
end
