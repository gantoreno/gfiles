require('nvim-navic').setup({
  lsp = {
    auto_attach = true,
  },
  icons = {
    File = '󰈤 ',
    Module = ' ',
    Namespace = ' ',
    Package = '󰏗 ',
    Class = '󰆩 ',
    Method = '󰆧 ',
    Property = '󰯠 ',
    Field = '󰆧 ',
    Constructor = '󰆧 ',
    Enum = '󰆜 ',
    Interface = ' ',
    Function = '󰆧 ',
    Variable = '󰮄 ',
    Constant = '󰭸 ',
    String = '󰭳 ',
    Number = ' ',
    Boolean = ' ',
    Array = '󰅪 ',
    Object = ' ',
    Key = '󰷖 ',
    Null = ' ',
    EnumMember = '󰆜 ',
    Struct = '󰌗 ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = '󱄽 ',
  },
  highlight = true,
  separator = '  ',
})
