vim.g.vimtex_view_method = "zathura"

vim.g.vimtex_quickfix_enabled = false
vim.keymap.set("n", "<localleader>lc", ":VimtexClean!<CR>", { noremap = true })
vim.keymap.set("n", "<localleader>lC", ":VimtexCompileOutput<CR>", { noremap = true })
