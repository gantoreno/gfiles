local servers = {
  'astro',
  'clangd',
  'emmet_language_server',
  'eslint',
  'elixirls',
  'gopls',
  'intelephense',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'tailwindcss',
  'templ',
  'ts_ls',
  'zls',
}

return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        {
          path = 'luvit-meta/library',
          words = {
            'vim%.uv',
          },
        },
      },
    },
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup({})
      require('mason-lspconfig').setup({
        automatic_installation = true,
        ensure_installed = servers,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig.ui.windows').default_options.border = 'rounded'

      -- local navic = require('nvim-navic')
      local cmp_lsp = require('cmp_nvim_lsp')
      local lspconfig = require('lspconfig')

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
            if client.server_capabilities.documentSymbolProvider then
              require('nvim-navic').attach(client, bufnr)
            end

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

              vim.lsp.buf.execute_command(params)
            end,
            description = 'Organize Imports',
          },
        },
      })

      -- Icons
      local signs = {
        Error = '',
        Warn = '',
        Hint = '󰛩',
        Info = '',
        Prefix = '',
      }

      for type, text in pairs(signs) do
        local texthl = 'DiagnosticSign' .. type
        local linehl = 'DiagnosticSign' .. type .. 'Line'

        vim.fn.sign_define(texthl, { text = text, texthl = texthl, linehl = linehl })
      end

      vim.diagnostic.config({
        float = {
          border = 'rounded',
          padding = { 0, 1 },
        },
        virtual_text = {
          prefix = signs.Prefix .. ' ',
        },
      })
    end,
  },
}
