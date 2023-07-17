local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      symbol_map = {
        Class = '󰓸',
        Color = '󰌁',
        Constant = '󰭸',
        Constructor = '󰆧',
        Enum = '󰆜',
        EnumMember = '󰆜',
        Event = '',
        Field = '󰆧',
        File = '󰈤',
        Folder = '󰉖',
        Function = '󰆧',
        Interface = '',
        Key = '󰷖',
        Method = '󰆧',
        Module = '',
        Operator = '󱖦',
        Property = '󰯠',
        Reference = '󰋺',
        Snippet = '󰅴',
        Struct = '󰌗',
        Text = '󰭳',
        TypeParameter = '󱄽',
        Unit = '󱍓',
        Value = '󰎠',
        Variable = '󰮄',
      },
    }),
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
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
      scrollbar = false,
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
      scrollbar = false,
    }),
  },
})
