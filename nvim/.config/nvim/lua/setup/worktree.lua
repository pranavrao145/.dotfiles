-- Setup remaps for git worktree

require("git-worktree").setup{}

vim.api.nvim_set_keymap('n', '<leader>gw', ':lua require(\'telescope\').extensions.git_worktree.git_worktrees()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ga', 'lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>', { noremap = true })