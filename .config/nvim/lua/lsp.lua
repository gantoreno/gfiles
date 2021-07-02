--    ______      __         _      __   Gabriel Moreno
--   / ____/___ _/ /_  _____(_)__  / /   ==============
--  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
-- / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
-- \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
-- 
-- Neovim LSP file

-- Custom `on_attach` function {{{
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {noremap = true, silent = true})
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {noremap = true, silent = true})
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {noremap = true, silent = true})
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {noremap = true, silent = true})
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {noremap = true, silent = true})

  return require'compe'.on_attach 
end
-- }}}

-- TS Server setup {{{
require'lspconfig'.tsserver.setup{
  on_attach = on_attach
}
-- }}}

-- Pyright setup {{{
require'lspconfig'.pyright.setup{
  on_attach = on_attach
}
-- }}}
