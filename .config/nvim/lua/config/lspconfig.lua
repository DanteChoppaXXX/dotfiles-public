-- read :h vim.lsp.config for changing options of lsp servers

-- Require lspconfig
local lspconfig = require('lspconfig')

-- Configure clangd
lspconfig.clangd.setup({
  cmd = { "clangd" },  -- if needed: full path, e.g., "C:/msys64/mingw64/bin/clangd.exe"
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  on_attach = function(client, bufnr)
    -- Keybindings
    local buf_map = function(mode, lhs, rhs, opts)
      opts = opts or { noremap=true, silent=true }
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    buf_map("n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>")
    buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  end,
})


