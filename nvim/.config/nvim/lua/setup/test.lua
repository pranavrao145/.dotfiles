-- Remaps for vim-test

vim.api.nvim_set_keymap("n", "<M-t>n", ":TestNearest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-t>f", ":TestFile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-t>s", ":TestSuite<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-t>l", ":TestLast<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-t>v", ":TestVisit<CR>", { noremap = true })
