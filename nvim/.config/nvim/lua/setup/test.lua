-- Remaps for vim-test

vim.keymap.set("n", "<M-t>n", ":TestNearest<CR>", { noremap = true })
vim.keymap.set("n", "<M-t>f", ":TestFile<CR>", { noremap = true })
vim.keymap.set("n", "<M-t>s", ":TestSuite<CR>", { noremap = true })
vim.keymap.set("n", "<M-t>l", ":TestLast<CR>", { noremap = true })
vim.keymap.set("n", "<M-t>v", ":TestVisit<CR>", { noremap = true })
