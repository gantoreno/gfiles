set nocompatible

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'gantoreno/vim-gabriel'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tomtom/tcomment_vim'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'

Plug 'neoclide/coc.nvim', { 'commit': '49d73e6', 'do': 'yarn install' }

call plug#end()

colorscheme gabriel

set background=dark
set backspace=indent,eol,start
set cmdheight=0
set clipboard=unnamedplus
set encoding=utf-8
set fileencoding=utf-8
set laststatus=3
set mouse=a
set shiftwidth=2
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
set relativenumber

set statusline=%!Statusline()

let g:mapleader = ' '

let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

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
let g:floaterm_position = 'bottom'
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

nmap <silent> <leader>tn :tabnew<CR>
nmap <silent> <leader><left> :tabprev<CR>
nmap <silent> <leader><right> :tabnext<CR>

nmap <silent> R <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>cc :TComment<CR>
vmap <silent> <leader>cc :TComment<CR>

nmap <silent> <leader>ff :Telescope find_files<CR>
nmap <silent> <leader>fg :Telescope live_grep<CR>
nmap <silent> <leader>nn :CocCommand explorer<CR>
nmap <silent> <leader>ss :SynStack<CR>
nmap <silent> <leader>coc :CocConfig<CR>

nmap <silent> <leader>lzg :FloatermNew --autoclose=2 --wintype=float --width=0.8 --height=0.8 --position=center lazygit<CR>
nmap <silent> <leader>glg :FloatermNew --autoclose=2 --wintype=float --width=0.8 --height=0.8 --position=center git log --graph<CR>

nnoremap <silent> K :call ShowDocumentation()<CR>

vmap <silent> <leader>so :sort<CR>

noremap <silent> <C-h> <C-\><C-n><C-w>h
noremap <silent> <C-j> <C-\><C-n><C-w>j
noremap <silent> <C-k> <C-\><C-n><C-w>k
noremap <silent> <C-l> <C-\><C-n><C-w>l

tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-l> <C-\><C-n><C-w>l

command! -nargs=0 SynStack :call SynStack()

autocmd BufNewFile,BufRead *.ejs set filetype=ejs
autocmd BufNewFile,BufRead *.config set filetype=yaml
autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx,*.ts set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh

augroup explorer
  autocmd!
  autocmd BufEnter * if winnr('$') == 1 && &filetype == 'coc-explorer' | q | endif
augroup end

augroup floaterm
  autocmd!
  autocmd FileType floaterm setlocal nonumber nocursorline norelativenumber signcolumn=no
augroup end

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

function Statusline() abort
  let b:leftstatus = ''
  let b:rightstatus = ''

  let b:leftstatus .= ' '
  
  let b:branch = FugitiveHead()

  if !empty(b:branch)
    let b:leftstatus .= ' %{b:branch}   '
  endif

  let b:leftstatus .= ' %{Warnings()} '
  let b:leftstatus .= ' %{Errors()}   '

  let b:leftstatus .= '-- %{toupper(g:currentmode[mode()])} --'

  let b:rightstatus .= 'Spaces: %{&shiftwidth}'
  let b:rightstatus .= '   %{empty(&fenc)?toupper(&fenc):toupper(&enc)}'
  let b:rightstatus .= '   %{toupper(g:endoflines[&ff])}'

  if !empty(&ft) && &ft != 'TelescopePrompt'
    let b:rightstatus .= '    %{&ft}'
  endif

  let b:rightstatus .= ' '

  return b:leftstatus . '%=' . b:rightstatus
endfunction

function Warnings() abort
  let info = get(b:, 'coc_diagnostic_info', {})

  if empty(info) | return '0' | endif

  return info['warning']
endfunction

function Errors() abort
  let info = get(b:, 'coc_diagnostic_info', {})

  if empty(info) | return '0' | endif

  return info['error']
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
