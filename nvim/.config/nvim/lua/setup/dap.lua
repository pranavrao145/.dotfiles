-- Setup for debugging each language
require("setup.nvim-dap.cpp")
require("setup.nvim-dap.python")
require("setup.nvim-dap.go")
require("setup.nvim-dap.java")

-- Maps

vim.keymap.set(
  "n",
  "<F10>",
  ":lua require('dap').continue()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<F10>",
  ":lua require('dap').continue()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<F8>",
  ":lua require('dap').step_over()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<F7>",
  ":lua require('dap').step_into()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<F6>",
  ":lua require('dap').step_out()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<F5>",
  ":lua require('dap').toggle_breakpoint()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<leader>dbc",
  ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<leader>dbl",
  ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<leader>dr",
  ":lua require('dap').repl.toggle()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<leader>dl",
  ":lua require('dap').run_last()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<F11>",
  ":lua require('dap').terminate()<CR>",
  { noremap = true }
)
