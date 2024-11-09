return {
  {
    'github/copilot.vim',
  },
  {
    'onsails/lspkind.nvim',
    config = function()
      require('lspkind').setup({
        preset = 'codicons',
      })
    end,
  },
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
          documentation = {
            border = 'rounded',
            winhighlight = 'Normal:NormalFLoat',
          },
          completion = {
            border = 'rounded',
            winhighlight = 'Normal:NormalFloat,CursorLine:CmpItemSel',
          },
        },
        experimental = {
          ghost_text = true,
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
          ['<down>'] = cmp.mapping.select_next_item(),
          ['<up>'] = cmp.mapping.select_prev_item(),
          ['<left>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<esc>'] = cmp.mapping({
            c = function()
              if cmp.visible() then
                cmp.close()
              else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, true, true), 'n', true)
              end
            end,
          }),

          -- Interaction
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
          ['<tab>'] = cmp.mapping.confirm({ select = true }),
        },
        formatting = {
          fields = { 'abbr', 'kind' },
          format = lspkind.cmp_format({
            mode = 'symbol_text',
          }),
        },
      })
    end,
  },
}
