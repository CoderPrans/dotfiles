call plug#begin('~/.vim/plugged')
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tomlion/vim-solidity'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'flazz/vim-colorschemes'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" call PlugInstall to install new plugins
call plug#end()

" basics
filetype plugin indent on
syntax on
set number
set cursorline
set incsearch
set ignorecase
set smartcase
set hlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap

" preferences
let mapleader = ","

" imapping emmet expand abbr
im <leader>. <C-Y>,

" nmapping for fuzzy finder
nmap <leader>f :FZF

" nmapping to clear search highlight
nmap <silent> <leader>c :nohlsearch<cr>

" stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" cd into local current directory
autocmd BufEnter * silent! lcd %:p:h

" change spacing for javascript
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
" execute node script
    \ nmap <buffer> <leader>l :!node %<cr>

" compile and run java
autocmd Filetype java
    \ nmap <buffer> <leader>l :!javac % && java %:r<cr>

" execute python
autocmd Filetype python
    \ nmap <buffer> <leader>l :!python %<cr>

" execute sh
autocmd Filetype sh
    \ nmap <buffer> <leader>l :!./%<cr>

" customize Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_list_hide = '^node_modules/$,^\\..*'

" custom statusline
set laststatus=2
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ⎇  ':''
endfunction

set statusline=
set statusline+=%{StatuslineGit()}
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %l,%c
set statusline+=\ %*
set statusline+=\ %*
set statusline+=\ %p%%
set statusline+=\ 

" theming vim
set termguicolors
set background=dark
colorscheme ir_black "jellybeans nord tender minimalist monokain

" clear cursorline highlight
hi clear CursorLineNR

" jsx
let g:jsx_ext_required = 0

" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" syntax reading for .svelte
au! BufNewFile,BufRead *.svelte set ft=html
