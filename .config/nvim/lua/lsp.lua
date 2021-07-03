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

-- Lua setup {{{
local system_name

if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-- }}}
