set nocompatible

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'gantoreno/vim-gabriel'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'yarn install' }

Plug 'tomtom/tcomment_vim'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'

call plug#end()

colorscheme gabriel

set background=dark
set backspace=indent,eol,start
set clipboard=unnamedplus
set encoding=utf-8
set fileencoding=utf-8
set laststatus=3
set mouse=a
set shiftwidth=2
set shortmess=FI
set signcolumn=number
set so=15
set softtabstop=2

set cursorline
set expandtab
set hidden
set nohlsearch
set noshowcmd
set noshowmode
set number
set splitbelow
set splitright
set termguicolors

set statusline=%!StatusLineNormal()

let g:mapleader = ' '

let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

let g:indentLine_char = "▏"
let g:indent_blankline_space_char = " "
let g:indent_blankline_filetype_exclude = [
  \ "help",
  \ "term",
  \ "packer",
  \ "dashboard",
  \ "NvimTree",
  \ ]
let g:indent_blankline_show_first_indent_level = v:true
let g:indent_blankline_show_trailing_blankline_indent = v:false

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-emmet',
  \ 'coc-python',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-explorer',
  \ ]
let g:coc_explorer_global_presets = {
  \ 'floating': {
  \   'position': 'floating',
  \ },
  \ }

let g:signify_sign_add = '┃'
let g:signify_sign_delete = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_changedelete = '┃'
let g:signify_sign_delete_first_line = '┃'
let g:signify_sign_show_count = 0

let g:floaterm_shell = 'NEOVIM=1 '.&shell
let g:floaterm_height = 0.25
let g:floaterm_autoclose = 1
let g:floaterm_wintype = 'split'
let g:floaterm_position = 'botright'
let g:floaterm_keymap_toggle = '<leader>tt'

let g:currentmode={
  \ 'n': 'Normal',
  \ 'no': 'Normal·Operator Pending',
  \ 'v': 'Visual',
  \ 'V': 'Visual Line',
  \ '^V': 'Visual Block',
  \ 's': 'Select',
  \ 'S': 'S Line',
  \ '^S': 'S Block',
  \ 'i': 'Insert',
  \ 'R': 'Replace',
  \ 'Rv': 'V Replace',
  \ 'c': 'Command',
  \ 'cv': 'Vim Ex',
  \ 'ce': 'Ex',
  \ 'r': 'Prompt',
  \ 'rm': 'More',
  \ 'r?': 'Confirm',
  \ '!': 'Shell',
  \ 't': 'Terminal'
  \ }

let g:endoflines = {
  \ 'unix': 'lf',
  \ 'windows': 'crlf'
  \ }

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_symbols = {
  \ 'linenr': ' ㏑:', 
  \ 'modified': '+', 
  \ 'whitespace': '☲', 
  \ 'branch': '', 
  \ 'ellipsis': '...', 
  \ 'paste': 'PASTE', 
  \ 'maxlinenr': '☰', 
  \ 'readonly': '⊝', 
  \ 'spell': 'SPELL', 
  \ 'space': ' ', 
  \ 'dirty': '!',
  \ 'colnr': '  ℅: ', 
  \ 'keymap': 'Keymap:', 
  \ 'crypt': '🔒', 
  \ 'notexists': ''
  \ }

let g:ctrlp_map = '<leader>pp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](build|node_modules|target|dist)|(\.(swp|ico|git|svn))$',
	\ 'file': '\v\.(dll|min.js|min.css|jpg|png|mp4)$'
	\ }

nmap <leader>sp :TSHighlightCapturesUnderCursor<CR>
nmap <leader>spp :TSPlaygroundToggle<CR>

nmap <silent> <leader><left> :tabprev<CR>
nmap <silent> <leader><right> :tabnext<CR>

nmap <F2> <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>cc :TComment<CR>
vmap <silent> <leader>cc :TComment<CR>

nmap <silent> <leader>ff :Telescope find_files<CR>
nmap <silent> <leader>fg :Telescope live_grep<CR>
nmap <silent> <leader>nn :CocCommand explorer<CR>
nmap <silent> <leader>ss :call SynStack()<CR>
nmap <silent> <leader>coc :CocConfig<CR>

nmap <silent> <leader>mk :FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center --autoclose=0 make<CR>
nmap <silent> <leader>lzg :FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center lazygit<CR>

vmap <silent> <leader>so :sort<CR>

noremap <silent> <C-h> <C-\><C-n><C-w>h
noremap <silent> <C-j> <C-\><C-n><C-w>j
noremap <silent> <C-k> <C-\><C-n><C-w>k
noremap <silent> <C-l> <C-\><C-n><C-w>l

tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-l> <C-\><C-n><C-w>l

nnoremap <silent> K :call ShowDocumentation()<CR>

autocmd FileType floaterm call FloatermSettings()

autocmd BufEnter * if winnr('$') == 1 && &filetype == 'coc-explorer' | q | endif

autocmd BufNewFile,BufRead *.ejs set filetype=ejs
autocmd BufNewFile,BufRead *.config set filetype=yaml
autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx,*.ts set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh

function SynStack()
  if !exists("*synstack")
    return
  endif

  let groups = map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

  echo groups
endfunction

function ShowDocumentation() abort
  if index(['vim', 'help'], &filetype) >= 0
    execute 'h ' . expand('<cword>')

    return
  endif

  call CocAction('doHover')
endfunction

function StatusLineNormal() abort
  let b:leftstatus = ''
  let b:rightstatus = ''
  
  let b:branch = FugitiveHead()

  hi SshGroup guibg=#fafafa guifg=#0d0d0d

  let b:leftstatus .= "%#SshGroup#    %#StatusLine#"

  let b:leftstatus .= '   '

  if !empty(b:branch)
    let b:leftstatus .= ' %{b:branch}   '
  endif

  let b:leftstatus .= ' %{StatusErrors()} '
  let b:leftstatus .= ' %{StatusWarnings()}   '

  let b:leftstatus .= '-- %{toupper(g:currentmode[mode()])} --'

  let b:rightstatus .= 'Spaces: %{&shiftwidth}'
  let b:rightstatus .= '   %{empty(&fenc)?toupper(&fenc):toupper(&enc)}'
  let b:rightstatus .= '   %{toupper(g:endoflines[&ff])}'

  if !empty(&ft) && &ft != 'TelescopePrompt'
    let b:rightstatus .= '    %{&ft}'
  endif

  let b:rightstatus .= '   '

  return b:leftstatus . '%=' . b:rightstatus
endfunction

function StatusWarnings() abort
  let info = get(b:, 'coc_diagnostic_info', {})

  if empty(info) | return '0' | endif

  return info['warning']
endfunction

function StatusErrors() abort
  let info = get(b:, 'coc_diagnostic_info', {})

  if empty(info) | return '0' | endif

  return info['error']
endfunction

function FloatermSettings() abort
  setlocal nonumber
  setlocal nocursorline
  setlocal norelativenumber

  setlocal signcolumn=no
endfunction

lua << EOF
require('telescope').setup({
  defaults = {
    mappings = { i = { ['<esc>'] = require('telescope.actions').close } },
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    file_ignore_patterns = { 'node_modules', '.git', 'build' },
  },
})
EOF
