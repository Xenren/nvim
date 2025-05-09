-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
--  "ts_ls",
--  "tailwindcss",
--  "eslint",
--  "gopls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- python
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   filetypes = { "python" },
-- }

--lspconfig.rust_analyzer.setup {
--  settings = {
--    ["rust_analyzer"] = {},
--  },
--}

-- cpp
-- lspconfig.clangd.setup {
--  on_attach = function(client, bufnr)
--    client.server_capabilities.signatureHelpProvider = false
--    on_attach(client, bufnr)
--  end,
--  capabilities = capabilities,
--}
