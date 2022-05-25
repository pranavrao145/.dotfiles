require("octo").setup()

vim.keymap.set("n", "<leader>oi", ":Octo issue ", { noremap = true })
vim.keymap.set("n", "<leader>op", ":Octo pr ", { noremap = true })
vim.keymap.set("n", "<leader>or", ":Octo reviewer add ", { noremap = true })

