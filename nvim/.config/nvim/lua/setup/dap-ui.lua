require("dapui").setup()

vim.api.nvim_set_keymap("n", "<leader>dd", ":lua require('dapui').toggle()<CR>", { noremap = true })
