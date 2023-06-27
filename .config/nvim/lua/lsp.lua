local lspconfig = require('lspconfig')
local cmp = require('cmp')
local cmp_lsp = require('cmp_nvim_lsp')

-- Setup language servers.
local servers = {
  'tsserver',
}

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

-- LSP settings (for overriding per client)
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = cmp_lsp.default_capabilities(),
    handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border
      }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = border 
      }),
    },
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(evt)
    local opts = { buffer = evt.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end
})

-- Setup completion
cmp.setup({
  sources = {
    { name = 'nvim_lsp' }
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
  }
})
