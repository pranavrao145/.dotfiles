-- Setup vim fugitive for git integration

vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gP', ':Git pull<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gB', ':Git blame<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ds', ':Gdiffsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gj', ':diffget //3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gf', ':diffget //2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gl', ':Git log<CR>', { noremap = true })