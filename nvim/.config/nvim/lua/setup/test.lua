-- Remaps for vim-test

vim.api.nvim_set_keymap("n", "<C-t>n", ":TestNearest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-t>f", ":TestFile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-t>s", ":TestSuite<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-t>l", ":TestLast<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-t>v", ":TestVisit<CR>", { noremap = true })
