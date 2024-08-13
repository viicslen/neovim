local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "intelephense", "phpactor", "psalm" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

 -- PHP
lspconfig.intelephense.setup({
  commands = {
    IntelephenseIndex = {
      function()
        vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
      end,
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- if client.server_capabilities.inlayHintProvider then
    --   vim.lsp.buf.inlay_hint(bufnr, true)
    -- end
  end,
  capabilities = capabilities
})

lspconfig.phpactor.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.completionProvider = false
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.implementationProvider = false
    client.server_capabilities.referencesProvider = false
    client.server_capabilities.renameProvider = false
    client.server_capabilities.selectionRangeProvider = false
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.typeDefinitionProvider = false
    client.server_capabilities.workspaceSymbolProvider = false
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.documentHighlightProvider = false
    client.server_capabilities.documentSymbolProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  },
  handlers = {
    ['textDocument/publishDiagnostics'] = function() end
  }
})

-- Vue, JavaScript, TypeScript
lspconfig.volar.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- if client.server_capabilities.inlayHintProvider then
    --   vim.lsp.buf.inlay_hint(bufnr, true)
    -- end
  end,
  capabilities = capabilities,
  -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
  -- This drastically improves the responsiveness of diagnostic updates on change
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})
