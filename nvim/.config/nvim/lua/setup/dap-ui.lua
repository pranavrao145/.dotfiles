require("dapui").setup()

vim.keymap.set("n", "<leader>dd", ":lua require('dapui').toggle()<CR>", { noremap = true })
