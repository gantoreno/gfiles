local fn = vim.fn
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local cmp_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

local servers = require('gantoreno.lsp.servers')

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
      document_formatting = false,
    },
    on_attach = function(client, bufnr)
      client.capabilities = cmp_lsp.default_capabilities()
    end,
  })
end

lspconfig['ts_ls'].setup({
  commands = {
    OrganizeImports = {
      function()
        local params = {
          command = '_typescript.organizeImports',
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = '',
        }

        lsp.buf.execute_command(params)
      end,
      description = 'Organize Imports',
    },
  },
})

-- Icons
diagnostic.config({
  float = {
    border = 'rounded',
    padding = { 0, 1 },
  },
})

local signs = {
  Error = '',
  Warn = '',
  Hint = '',
  Info = '',
}

for type, text in pairs(signs) do
  local texthl = 'DiagnosticSign' .. type
  local linehl = 'DiagnosticSign' .. type .. 'Line'

  fn.sign_define(texthl, { text = text, texthl = texthl, linehl = linehl })
end
