-- Setup remaps for rails.vim

vim.api.nvim_set_keymap('n', '<leader>rc', ':Econtroller<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rv', ':Eview<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rm', ':Emodel<CR>', { noremap = true })