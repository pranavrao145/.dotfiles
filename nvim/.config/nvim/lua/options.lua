-- Set basic options

vim.opt.syntax = "on"

vim.opt.exrc = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/home/cypher/.config/nvim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.backspace = "indent,eol,start"
vim.opt.lazyredraw = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.regexpengine = 0
vim.opt.diffopt = vim.opt.diffopt + "vertical"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.termencoding = "utf-8"
vim.opt.showmode = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.background = "dark"
vim.opt.mouse = "a"
-- vim.opt.guicursor = ""
vim.opt.pumblend = 15
vim.opt.path = vim.o.path .. ",**"
vim.opt.laststatus = 3
vim.opt.winbar = "%t %m"

vim.cmd([[
    let &runtimepath.=',' . expand("$HOME") . '/Programming/refactoring.nvim/master'
]])

-- Set map leader
vim.cmd("let mapleader=' '")

-- Set custom netrw http command
vim.cmd('let g:netrw_http_cmd="brave"')

-- Set filetype
vim.cmd("filetype plugin indent on")

-- Autocmds for text files (wrap, linebreaks)
vim.cmd([[
  augroup textDocuments
    autocmd!
    autocmd FileType text set wrap linebreak
  augroup end
]])

-- Highlight on yank
local highlight_group =
  vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
