local neogen = require("neogen")

-- Setup neogen
neogen.setup()

-- Setup maps for neogen
vim.api.nvim_set_keymap("n", "<leader>nf", ":Neogen func<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>nc", ":Neogen class<CR>", { noremap = true })
