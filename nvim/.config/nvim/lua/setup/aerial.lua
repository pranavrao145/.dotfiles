require("aerial").setup({
  layout = {
    min_width = 30,
  },
  -- open_automatic = true,
  attach_mode = "global",
})

vim.keymap.set("n", "<leader>os", "<cmd>AerialToggle<CR>", { noremap = true })
