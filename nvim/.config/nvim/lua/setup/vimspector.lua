-- Set up vimspector as a debugger

vim.cmd("let g:vimspector_enable_mappings = 'HUMAN'")

vim.keymap.set("n", "<leader>dd", ":call vimspector#Launch()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>de", ":call vimspector#Reset()<CR>", { noremap = true })

-- Load vimspector map
vim.keymap.set("n", "<leader>dl", ":PackerLoad vimspector<CR>", { noremap = true })
