-- Setup harpoon

require("harpoon").setup({
  global_settings = {
    enter_on_sendcmd = true,
    tmux_autoclose_windows = true,
  },
})

-- Harpoon mark commands
vim.cmd([[
    nnoremap <leader>' :lua require("harpoon.mark").add_file()<CR>
    nnoremap <silent>'a :lua require("harpoon.ui").nav_file(1)<CR>
    nnoremap <silent>'s :lua require("harpoon.ui").nav_file(2)<CR>
    nnoremap <silent>'d :lua require("harpoon.ui").nav_file(3)<CR>
    nnoremap <silent>'f :lua require("harpoon.ui").nav_file(4)<CR>
    nnoremap <silent>'g :lua require("harpoon.ui").nav_file(5)<CR>

    nnoremap <silent>'t :lua require("harpoon.term").gotoTerminal(1)<CR>
]])

-- Other maps (terminal, ui, etc)
vim.keymap.set(
  "n",
  "<leader>h",
  ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<leader>H",
  ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>',
  { noremap = true }
)

-- vim.keymap.set(
--   "n",
--   "<leader>T",
--   ':lua require("harpoon.tmux").gotoTerminal(3)<CR>',
--   { noremap = true }
-- )
-- vim.keymap.set(
--   "n",
--   "<leader>t",
--   ':lua require("harpoon.tmux").gotoTerminal(2)<CR>',
--   { noremap = true }
-- )

vim.keymap.set(
  "n",
  "<leader><Enter>",
  ':lua require("harpoon.tmux").sendCommand(1, 1)<CR>',
  { noremap = true }
)

vim.keymap.set(
  "n",
  "<leader>\\",
  ':lua require("harpoon.tmux").sendCommand(2, 2)<CR>',
  { noremap = true }
)

vim.keymap.set(
  "n",
  "<leader>]",
  ':lua require("harpoon.tmux").sendCommand(3, 3)<CR>',
  { noremap = true }
)
