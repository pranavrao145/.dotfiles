-- Setup remaps for rails.vim

vim.api.nvim_set_keymap("n", "<leader>rC", ":Econtroller<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>rV", ":Eview<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>rM", ":Emodel<CR>", { noremap = true })
