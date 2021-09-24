-- Remaps for vim-test

vim.api.nvim_set_keymap('n', '<C-t>n', ':TestNearest', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>f', ':TestFile', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>s', ':TestSuite', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>l', ':TestLast', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>v', ':TestVisit', { noremap = true })