vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"

vim.keymap.set("n", "<localleader>lc", ":VimtexClean!<CR>", { noremap = true })
