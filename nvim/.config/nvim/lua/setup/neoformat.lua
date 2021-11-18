-- Map to format the current document with the correct formatter
vim.api.nvim_set_keymap("n", "<leader>fm", ":Neoformat <bar> :w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fM", ":cfdo :Neoformat <bar> :w<CR>", { noremap = true })
