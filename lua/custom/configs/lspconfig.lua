local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

lspconfig.pylsp.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentHighlightProvider = true
    on_attach(client, bufnr)
  end,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E126', 'E201', 'E202', 'E231', 'E226', 'E261', 'E262', 'E265', 'E302', 'E303', 'E501', 'W292', 'W293', 'W391', 'W503'},
        }
      }
    }
  }
}
