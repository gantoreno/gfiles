--    ______      __         _      __   Gabriel Moreno
--   / ____/___ _/ /_  _____(_)__  / /   ==============
--  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
-- / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
-- \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
-- 
-- Neovim LSP file

-- TS Server setup {{{
require'lspconfig'.tsserver.setup{
  on_attach = require'compe'.on_attach
}
-- }}}

-- Pyright setup {{{
require'lspconfig'.pyright.setup{
  on_attach = require'compe'.on_attach
}
-- }}}
