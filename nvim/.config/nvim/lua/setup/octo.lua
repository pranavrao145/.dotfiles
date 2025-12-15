require("octo").setup({
  default_to_projects_v2 = true,
})

vim.keymap.set("n", "<leader>oi", ":Octo issue ", { noremap = true })
vim.keymap.set("n", "<leader>op", ":Octo pr ", { noremap = true })
vim.keymap.set("n", "<leader>or", ":Octo review ", { noremap = true })
vim.keymap.set("n", "<leader>oR", ":Octo reviewer add ", { noremap = true })
vim.keymap.set("n", "<leader>ol", ":Octo label ", { noremap = true })
