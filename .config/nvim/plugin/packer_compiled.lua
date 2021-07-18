-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/gabrielmoreno/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    config = { "\27LJ\2\n:\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\28AutoPairsShortcutToggle\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\t\0\0\a\0 \0-6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\0015\2\14\0005\3\r\0=\3\a\2=\2\15\0015\2\17\0005\3\16\0=\3\a\2=\2\18\0015\2\20\0005\3\19\0=\3\a\2'\3\21\0006\4\22\0009\4\23\4'\6\24\0B\4\2\2'\5\25\0&\3\5\3=\3\26\2=\2\27\1=\1\4\0006\0\0\0009\0\1\0005\1\29\0=\1\28\0006\0\0\0009\0\1\0'\1\31\0=\1\30\0K\0\1\0\14telescope dashboard_default_executive\1\6\0\0Q The nitrogen in our DNA, the calcium in our teeth, the iron in our blood,  Qthe carbon in our apple pies were made in the interiors of collapsing stars.Q                         We are made of starstuff.                          \5Q                                - Carl Sagan                                \28dashboard_custom_footer\6e\fcommand\22/.config/nvim'}})\tHOME\vgetenv\aosBlua require('telescope.builtin').find_files({search_dirs = {'\1\0\0\1\2\0\0\29  Neovim Config Files\6d\1\0\1\fcommand\24Telescope live_grep\1\2\0\0\29  Find Word          \6c\1\0\1\fcommand\16SessionLoad\1\2\0\0\29  Load Last Session  \6b\1\0\1\fcommand\23Telescope oldfiles\1\2\0\0\29  Recently Seen Files\6a\1\0\0\16description\1\0\1\fcommand\25Telescope find_files\1\2\0\0\29  Find File          \29dashboard_custom_section\1\6\0\0(   ______      __         _      __(  / ____/___ _/ /_  _____(_)__  / /( / / __/ __ `/ __ \\/ ___/ / _ \\/ / (/ /_/ / /_/ / /_/ / /  / /  __/ /  (\\____/\\__,_/_.___/_/  /_/\\___/_/   \28dashboard_custom_header\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["diagnosticls-nvim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/diagnosticls-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\14hint_sign\b\15error_sign\b\15infor_sign\b\14warn_sign\b\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n]\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\nexact\14substring\nfuzzy&completion_matching_strategy_list\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\3\0\0\2\0\5\0\0066\0\0\0009\0\1\0009\0\2\0005\1\4\0=\1\3\0K\0\1\0\1\26\0\0\16 (Text) \17 (Method)\19 (Function)\22 (Constructor)\16ﴲ (Field)\19 (Variable)\16 (Class)\20ﰮ (Interface)\17 (Module)\18襁(Property)\15 (Unit)\16 (Value)\14練(Enum)\18 (Keyword)\18 (Snippet)\16 (Color)\15 (File)\20 (Reference)\17 (Folder)\21 (EnumMember)\19ﲀ (Constant)\17ﳤ (Struct)\16 (Event)\19 (Operator)\24 (TypeParameter)\23CompletionItemKind\rprotocol\blsp\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\2\0\0\3\0\16\0$6\0\0\0009\0\1\0)\1(\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\0\0=\1\t\0006\0\n\0'\2\v\0B\0\2\0029\0\f\0009\0\r\0'\1\15\0=\1\14\0K\0\1\0\ano\15signcolumn\fwinopts\tView\19nvim-tree.view\frequire\29nvim_tree_indent_markers\27nvim_tree_quit_on_open\25nvim_tree_update_cwd\25nvim_tree_auto_close\1\2\0\0\t.git\21nvim_tree_ignore\21nvim_tree_follow\20nvim_tree_width\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\t\0\17\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\t\0005\4\a\0005\5\5\0006\6\0\0'\b\3\0B\6\2\0029\6\4\6=\6\6\5=\5\b\4=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\16\2B\0\2\1K\0\1\0\rdefaults\1\0\0\25file_ignore_patterns\1\3\0\0\17node_modules\t.git\16borderchars\1\t\0\0\b─\b│\b─\b│\b┌\b┐\b┘\b└\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\22telescope.actions\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-airline"] = {
    config = { "\27LJ\2\n�\2\0\0\2\0\t\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0K\0\1\0001airline#extensions#tabline#show_close_button,airline#extensions#tabline#show_buffers+airline#extensions#tabline#show_splits'airline#extensions#tabline#enabled\28airline_powerline_fonts\14startrail\18airline_theme\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-prettier"] = {
    config = { "\27LJ\2\n�\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0K\0\1\0'prettier#autoformat_require_pragma\30prettier#quickfix_enabled\24prettier#autoformat\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-signify"] = {
    config = { "\27LJ\2\n�\1\0\0\2\0\t\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\3\0=\1\5\0006\0\0\0009\0\1\0'\1\3\0=\1\6\0006\0\0\0009\0\1\0'\1\3\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0K\0\1\0\28signify_sign_show_count#signify_sign_delete_first_line\30signify_sign_changedelete\24signify_sign_change\24signify_sign_delete\b┃\21signify_sign_add\6g\bvim\0" },
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-startrail"] = {
    loaded = true,
    path = "/Users/gabrielmoreno/.local/share/nvim/site/pack/packer/start/vim-startrail"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\2\0\n\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0006\0\0\0009\0\1\0+\1\1\0=\1\t\0K\0\1\0004indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\6\0\0\thelp\tterm\vpacker\14dashboard\rNvimTree&indent_blankline_filetype_exclude\6  indent_blankline_space_char\b▏\20indentLine_char\6g\bvim\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
time([[packadd for indent-blankline.nvim]], true)
vim.cmd [[packadd indent-blankline.nvim]]
time([[packadd for indent-blankline.nvim]], false)
-- Config for: vim-prettier
time([[Config for vim-prettier]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0K\0\1\0'prettier#autoformat_require_pragma\30prettier#quickfix_enabled\24prettier#autoformat\6g\bvim\0", "config", "vim-prettier")
time([[Config for vim-prettier]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n]\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\nexact\14substring\nfuzzy&completion_matching_strategy_list\6g\bvim\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�\t\0\0\a\0 \0-6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\0015\2\14\0005\3\r\0=\3\a\2=\2\15\0015\2\17\0005\3\16\0=\3\a\2=\2\18\0015\2\20\0005\3\19\0=\3\a\2'\3\21\0006\4\22\0009\4\23\4'\6\24\0B\4\2\2'\5\25\0&\3\5\3=\3\26\2=\2\27\1=\1\4\0006\0\0\0009\0\1\0005\1\29\0=\1\28\0006\0\0\0009\0\1\0'\1\31\0=\1\30\0K\0\1\0\14telescope dashboard_default_executive\1\6\0\0Q The nitrogen in our DNA, the calcium in our teeth, the iron in our blood,  Qthe carbon in our apple pies were made in the interiors of collapsing stars.Q                         We are made of starstuff.                          \5Q                                - Carl Sagan                                \28dashboard_custom_footer\6e\fcommand\22/.config/nvim'}})\tHOME\vgetenv\aosBlua require('telescope.builtin').find_files({search_dirs = {'\1\0\0\1\2\0\0\29  Neovim Config Files\6d\1\0\1\fcommand\24Telescope live_grep\1\2\0\0\29  Find Word          \6c\1\0\1\fcommand\16SessionLoad\1\2\0\0\29  Load Last Session  \6b\1\0\1\fcommand\23Telescope oldfiles\1\2\0\0\29  Recently Seen Files\6a\1\0\0\16description\1\0\1\fcommand\25Telescope find_files\1\2\0\0\29  Find File          \29dashboard_custom_section\1\6\0\0(   ______      __         _      __(  / ____/___ _/ /_  _____(_)__  / /( / / __/ __ `/ __ \\/ ___/ / _ \\/ / (/ /_/ / /_/ / /_/ / /  / /  __/ /  (\\____/\\__,_/_.___/_/  /_/\\___/_/   \28dashboard_custom_header\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\t\0\17\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\t\0005\4\a\0005\5\5\0006\6\0\0'\b\3\0B\6\2\0029\6\4\6=\6\6\5=\5\b\4=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\16\2B\0\2\1K\0\1\0\rdefaults\1\0\0\25file_ignore_patterns\1\3\0\0\17node_modules\t.git\16borderchars\1\t\0\0\b─\b│\b─\b│\b┌\b┐\b┘\b└\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\22telescope.actions\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\3\0\0\2\0\5\0\0066\0\0\0009\0\1\0009\0\2\0005\1\4\0=\1\3\0K\0\1\0\1\26\0\0\16 (Text) \17 (Method)\19 (Function)\22 (Constructor)\16ﴲ (Field)\19 (Variable)\16 (Class)\20ﰮ (Interface)\17 (Module)\18襁(Property)\15 (Unit)\16 (Value)\14練(Enum)\18 (Keyword)\18 (Snippet)\16 (Color)\15 (File)\20 (Reference)\17 (Folder)\21 (EnumMember)\19ﲀ (Constant)\17ﳤ (Struct)\16 (Event)\19 (Operator)\24 (TypeParameter)\23CompletionItemKind\rprotocol\blsp\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: auto-pairs
time([[Config for auto-pairs]], true)
try_loadstring("\27LJ\2\n:\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\28AutoPairsShortcutToggle\6g\bvim\0", "config", "auto-pairs")
time([[Config for auto-pairs]], false)
-- Config for: vim-airline
time([[Config for vim-airline]], true)
try_loadstring("\27LJ\2\n�\2\0\0\2\0\t\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0K\0\1\0001airline#extensions#tabline#show_close_button,airline#extensions#tabline#show_buffers+airline#extensions#tabline#show_splits'airline#extensions#tabline#enabled\28airline_powerline_fonts\14startrail\18airline_theme\6g\bvim\0", "config", "vim-airline")
time([[Config for vim-airline]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\2\0\0\3\0\16\0$6\0\0\0009\0\1\0)\1(\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\0\0=\1\t\0006\0\n\0'\2\v\0B\0\2\0029\0\f\0009\0\r\0'\1\15\0=\1\14\0K\0\1\0\ano\15signcolumn\fwinopts\tView\19nvim-tree.view\frequire\29nvim_tree_indent_markers\27nvim_tree_quit_on_open\25nvim_tree_update_cwd\25nvim_tree_auto_close\1\2\0\0\t.git\21nvim_tree_ignore\21nvim_tree_follow\20nvim_tree_width\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-signify
time([[Config for vim-signify]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\t\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\3\0=\1\5\0006\0\0\0009\0\1\0'\1\3\0=\1\6\0006\0\0\0009\0\1\0'\1\3\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0K\0\1\0\28signify_sign_show_count#signify_sign_delete_first_line\30signify_sign_changedelete\24signify_sign_change\24signify_sign_delete\b┃\21signify_sign_add\6g\bvim\0", "config", "vim-signify")
time([[Config for vim-signify]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\14hint_sign\b\15error_sign\b\15infor_sign\b\14warn_sign\b\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
