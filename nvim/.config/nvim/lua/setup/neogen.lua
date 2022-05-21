local neogen = require("neogen")

-- Setup neogen
neogen.setup()

-- Setup maps for neogen
vim.keymap.set("n", "<leader>nf", ":Neogen func<CR>", { noremap = true })
vim.keymap.set("n", "<leader>nc", ":Neogen class<CR>", { noremap = true })
vim.keymap.set("n", "<leader>nt", ":Neogen type<CR>", { noremap = true })
vim.keymap.set("n", "<leader>nF", ":Neogen file<CR>", { noremap = true })
