-- Map to format the current document with the correct formatter
vim.keymap.set("n", "<leader>fm", ":Neoformat <bar> :w<CR>", { noremap = true })
vim.keymap.set(
  "n",
  "<leader>fM",
  ":cfdo :Neoformat <bar> :w!<CR>",
  { noremap = true }
)
