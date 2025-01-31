require("oil").setup({
  keymaps = {
    ["<C-p>"] = false,
    ["<C-v>"] = "actions.preview",
  },
  view_options = {
    show_hidden = true
  },
  skip_confirm_for_simple_edits = true
})

vim.cmd([[ autocmd DirChanged * lua vim.schedule_wrap(require('oil').open)(vim.v.event.cwd) ]])
