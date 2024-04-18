-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- lsps with default config
local servers = {
  "biome",
  "cssls",
  "html",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.pyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}
lspconfig.ruff_lsp.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end,
}

lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  on_init = on_init,
  capabilities = capabilities,
}
