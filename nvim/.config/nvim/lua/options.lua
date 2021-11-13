-- Set basic options
vim.cmd([[
    syntax on 

    set exrc
    set tabstop=4 softtabstop=4
    set shiftwidth=4 
    set expandtab
    set smartindent
    set nohlsearch
    set hidden
    set noerrorbells
    set nu
    set relativenumber
    set nowrap
    set noswapfile
    set nobackup
    set undodir=~/.config/nvim/undodir
    set undofile
    set incsearch
    set termguicolors 
    set scrolloff=8
    set signcolumn=yes 
    set colorcolumn=80
    set backspace=indent,eol,start
    set lazyredraw           
    set ignorecase smartcase
    set regexpengine=0
    set diffopt+=vertical
    set encoding=utf-8
    set fileencoding=utf-8
    set termencoding=utf-8
    set noshowmode
    set completeopt=menu,menuone,noselect
    set background=dark
    set mouse=a
]])

-- Set map leader
vim.cmd("let mapleader=' '")

-- Set custom netrw http command
vim.cmd('let g:netrw_http_cmd="firefox"')

-- Set filetype
vim.cmd("filetype plugin indent on")
