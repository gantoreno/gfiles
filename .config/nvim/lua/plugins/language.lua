local servers = {
  'astro',
  'clangd',
  'emmet_language_server',
  'eslint',
  'elixirls',
  'gopls',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'tailwindcss',
  'templ',
  'ts_ls',
  'zls',
}

return {
  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'l3mon4d3/luasnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      cmp.setup({
        window = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered(),
          scrollbar = {
            winhighlight = 'PmenuSbar:CmpSbPmenuSbar,Scrollbar:CmpSbScrollbar,PmenuThumb:CmpSbPmenuThumb',
          },
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }),
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = {
          -- Navigation
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),

          -- Interaction
          ['<Cr>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        formatting = {
          fields = { 'kind', 'abbr' },
          format = lspkind.cmp_format({
            mode = 'symbol',
          }),
        },
      })
    end,
  },

  -- LSP configuration
  {
    'onsails/lspkind.nvim',
    config = function()
      require('lspkind').setup({
        preset = 'codicons',
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig.ui.windows').default_options.border = 'rounded'

      local navic = require('nvim-navic')
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
              navic.attach(client, bufnr)
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
      vim.diagnostic.config({
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

        vim.fn.sign_define(texthl, { text = text, texthl = texthl, linehl = linehl })
      end
    end,
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

  -- Symbol providers
  {
    'SmiteshP/nvim-navic',
    config = function()
      local navic = require('nvim-navic')
      local get_icon_color = require('nvim-web-devicons').get_icon_color

      local winbar_ignore_filetypes = {
        NvimTree = true,
      }

      navic.setup({
        highlight = true,
        safe_output = true,
        separator = ' › ',
        icons = {
          File = ' ',
          Module = ' ',
          Namespace = ' ',
          Package = ' ',
          Class = ' ',
          Method = ' ',
          Property = ' ',
          Field = ' ',
          Constructor = ' ',
          Enum = ' ',
          Interface = ' ',
          Function = ' ',
          Variable = ' ',
          Constant = ' ',
          String = ' ',
          Number = ' ',
          Boolean = ' ',
          Array = ' ',
          Object = ' ',
          Key = ' ',
          Null = ' ',
          EnumMember = ' ',
          Struct = ' ',
          Event = ' ',
          Operator = ' ',
          TypeParameter = ' ',
        },
      })

      function Breadcrumbs()
        local location = navic.get_location()

        local current_file = vim.fn.expand('%:t')
        local current_file_extension = vim.fn.fnamemodify(current_file, ':e')

        if current_file == '' then
          current_file = '[No Name]'
        end

        local icon, fg = get_icon_color(current_file, current_file_extension, { default = true })
        local bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Winbar')), 'bg')

        vim.api.nvim_set_hl(0, 'BreadcrumbsIconColor', { fg = fg, bg = bg })

        return ' %#BreadcrumbsIconColor#'
          .. icon
          .. ' %#Winbar#'
          .. current_file
          .. (location == '' and '' or ' › ' .. location)
      end

      vim.api.nvim_create_autocmd('BufWinEnter', {
        pattern = '*',
        callback = function()
          local filetype = vim.bo.filetype

          local window_config = vim.api.nvim_win_get_config(0).relative
          local window_name = vim.api.nvim_buf_get_name(0)
          local window_option = vim.api.nvim_buf_get_option(0, 'buftype')

          if
            winbar_ignore_filetypes[filetype]
            or filetype == ''
            or window_config ~= ''
            or window_name == ''
            or window_option ~= ''
          then
            return
          end

          vim.wo.winbar = '%{%v:lua.Breadcrumbs()%}'
        end,
      })
    end,
  },

  -- Syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        autopairs = { enable = true },
        indent = { enable = true },
        highlight = { enable = true },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
    end,
  },
}
