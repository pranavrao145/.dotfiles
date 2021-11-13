-- Set up vimspector as a debugger

vim.cmd("let g:vimspector_enable_mappings = 'HUMAN'")

vim.api.nvim_set_keymap("n", "<leader>dd", ":call vimspector#Launch()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>de", ":call vimspector#Reset()<CR>", { noremap = true })

-- Load vimspector map
vim.api.nvim_set_keymap("n", "<leader>dl", ":PackerLoad vimspector<CR>", { noremap = true })
