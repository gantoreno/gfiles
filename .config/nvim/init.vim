"    ______      __         _      __   Gabriel Moreno
"   / ____/___ _/ /_  _____(_)__  / /   ==============
"  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
" / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
" \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
" 
" Neovim configuration file

" Plugins {{{
call plug#begin('~/.vim/plugged')

" Colorschemes {{{
Plug 'gantoreno/vim-substrata'
Plug 'altercation/vim-colors-solarized'
" }}}

" Syntax highlighters {{{
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'herringtondarkholme/yats.vim'
" }}}

" Lua support {{{
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" }}}

" Devicons {{{
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" }}}

" Fuzzy finding {{{
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-telescope/telescope.nvim'
" }}}

" Commenting {{{
Plug 'tomtom/tcomment_vim'
" }}}

" Editor tools {{{
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'editorconfig/editorconfig-vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" }}}

" Indentlines {{{
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
" }}}

" Airline {{{
Plug 'vim-airline/vim-airline'
" }}}

" Language servers {{{
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" }}}

call plug#end()
" }}}

" Language {{{
language en_US
" }}}

" Syntax {{{
syntax on
" }}}

" Colorscheme {{{
let g:substrata_italic_comments=0
let g:substrata_italic_functions=0

colorscheme substrata
" }}}

" Filetype {{{
filetype plugin indent on
" }}}

" Settings {{{
set nolist
set exrc
set hidden
set number
set nowrap
set noshowcmd
set expandtab
set cursorline
set noswapfile
set splitbelow
set splitright
set noshowmode
set nohlsearch
set smartindent
set noerrorbells
set termguicolors
set relativenumber

set mouse=a
set tabstop=2
set encoding=UTF-8
set scrolloff=10
set listchars=eol:↴,nbsp:·,space:·,trail:·
set backspace=indent,eol,start
set clipboard=unnamedplus
set shiftwidth=2
set laststatus=2
set signcolumn=yes
set backupcopy=yes
set background=dark
set foldmethod=marker
set softtabstop=0
" }}}

" Variables {{{
let g:mapleader="\<space>"

let g:term_rows=15

let g:minimap_width=20
let g:minimap_auto_start=1
let g:minimap_auto_start_win_enter=1

let g:indentLine_char='│'
let g:indent_blankline_space_char=' '
let g:indent_blankline_filetype_exclude=[
      \ 'term',
      \ 'coc-explorer'
      \ ]
let g:indent_blankline_show_first_indent_level=v:true
let g:indent_blankline_show_trailing_blankline_indent=v:false

let g:signify_sign_add='┃'
let g:signify_sign_delete='┃'
let g:signify_sign_change='┃'
let g:signify_sign_changedelete='┃'
let g:signify_sign_delete_first_line='┃'
let g:signify_sign_show_count=v:false

let g:ctrlp_user_command=[
      \ '.git/', 
      \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
      \ ]

let g:airline_theme='substrata'
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0

let g:python_pep8_indent_multiline_string=1

let g:autopep8_on_save=1
let g:autopep8_disable_show_diff=1

let g:vim_json_syntax_conceal=0

let g:closetag_filenames='*.html,*.js,*.jsx,*.ts,*.tsx'

let g:user_emmet_settings={
      \ 'javascriptreact' : {
      \ 'extends' : 'jsx',
      \ },
      \ 'typescriptreact' : {
      \ 'extends' : 'jsx',
      \ },
      \ }

let g:coc_global_extensions=[
      \ 'coc-go',
      \ 'coc-rls',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-phpls',
      \ 'coc-pairs',
      \ 'coc-python',
      \ 'coc-eslint',
      \ 'coc-vimtex',
      \ 'coc-clangd',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-explorer',
      \ ]
let g:coc_explorer_global_presets={
      \ 'floating': {
      \ 'position': 'floating',
      \ 'open-action-strategy': 'sourceWindow',
      \ },
      \ }
" }}}

" Mappings {{{
" map <up>    <nop>
" map <down>  <nop>
" map <left>  <nop>
" map <right> <nop>

map <silent> <leader>cc   :TComment<CR>
map <silent> <leader>nn   :CocCommand explorer<CR>
map <silent> <leader>ff   :Telescope find_files<CR>
map <silent> <leader>pp   :MarkdownPreview<CR>
map <silent> <leader>tt   :call ToggleTerminal(g:term_rows)<CR>
map <silent> <leader>xp   :!expand<CR><CR>
map <silent> <leader>wsus :!workspace up -s  2> /dev/null<CR><CR>
map <silent> <leader>wsud :!workspace up -d  2> /dev/null<CR><CR>
map <silent> <leader>wsue :!workspace up -e  2> /dev/null<CR><CR>
map <silent> <leader>wsd  :!workspace down 2> /dev/null<CR><CR>

nmap <F2>         <Plug>(coc-rename)
nmap <silent> gd  <Plug>(coc-definition)
nmap <silent> gy  <Plug>(coc-type-definition)
nmap <silent> gi  <Plug>(coc-implementation)
nmap <silent> gr  <Plug>(coc-references)
nmap <leader>coc  :CocConfig<CR>
nmap <leader>tw   :call ToggleWorkspace()<CR>

nnoremap <silent> K :call ShowDocumentation()<CR>

" inoremap <up>    <nop>
" inoremap <down>  <nop>
" inoremap <left>  <nop>
" inoremap <right> <nop>
" }}}

" Autocommands {{{
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx,*.ts set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh

autocmd BufNewFile,BufRead *.html,*.css,*.js,*.jsx,*.ts,*.tsx 
      \ let g:user_emmet_expandabbr_key="<Tab>" | 
      \ imap <expr> <Tab> emmet#expandAbbrIntelligent("\<Tab>")
" }}}

" Functions {{{
function! SynStack()
  if !exists("*synstack")
    return
  endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! ShowDocumentation()
  if index(['vim', 'help'], &filetype) >= 0
    execute "h ".expand('<cword>')
    return
  endif

  call CocAction('doHover')
endfunction

function! SearchBuffer(pattern)
  let window_num=bufnr('$')

  for i in range(1, window_num)
    let is_match=matchstr(bufname(i), a:pattern)

    if !empty(is_match)
      return i
    endif
  endfor

  return -1
endfunction

function! ToggleTerminal(rows)
  let term_buffer=SearchBuffer('term:\/\/.*')
  
  if term_buffer != -1 
    execute term_buffer.'bd!'
    return
  endif

  execute a:rows.'sp term://zsh'
  
  execute "setlocal nonu"
  execute "setlocal nornu"
  execute "setlocal nocursorline"
  execute "setlocal nocursorcolumn"
  execute "setlocal signcolumn=no"

  silent autocmd BufLeave <buffer> stopinsert!
  silent autocmd BufWinEnter,WinEnter <buffer> startinsert!

  execute "tnoremap <buffer> <C-w><Up> <C-\\><C-n><C-w><C-k>"
  execute "tnoremap <buffer> <C-n> <C-\\><C-n>"
  execute "tnoremap <buffer> <esc> <C-\\><C-n>"
  
  execute "setlocal nobuflisted"

  startinsert!
endfunction
" }}}

" Autogroups {{{
augroup code_dark_settings
  autocmd!
  autocmd BufEnter * 
        \ if exists('g:colors_name') && g:colors_name == 'codedark'
        \ | hi link jsxComponentName xmlTag
        \ | hi link jsxCloseString   htmlTag
        \ | hi link jsxTagName       htmlTagName
        \ | hi link jsxAttrib        htmlArg
        \ | hi link jsxBraces        jsArrowFunction |
        \ endif
augroup end

augroup substrata_settings
  autocmd!
  autocmd BufEnter * 
        \ if exists('g:colors_name') && g:colors_name == 'substrata'
        \ | hi Normal guibg=none
        \ | hi link TelescopeBorder        comment 
        \ | hi link TelescopePromptBorder  comment 
        \ | hi link TelescopeResultsBorder comment 
        \ | hi link TelescopePreviewBorder comment
        \ | hi link CocExplorerIndentLine  comment |
        \ endif
augroup end

augroup solarized_settings
  autocmd!
  autocmd BufEnter * 
        \ if exists('g:colors_name') && g:colors_name == 'solarized'
        \ | hi Normal     ctermbg=none |
        \ | hi SignColumn ctermbg=black |
        \ endif
augroup end

augroup terminal_settings
  autocmd!

  autocmd BufLeave             term://* stopinsert!
  autocmd BufWinEnter,WinEnter term://* startinsert!
  autocmd TermClose            term://*
        \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc")
        \ | call nvim_input('<CR>') |
        \ endif
augroup end
" }}}

" Lua {{{
lua << EOF
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close, 
      },
    },
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
  }
}
EOF
" }}}
