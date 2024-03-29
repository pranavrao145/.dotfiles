local refactoring = require("refactoring")

refactoring.setup({
  prompt_func_return_type = {
    go = true,
    cpp = true,
    c = true,
    java = true,
  },
  prompt_func_param_type = {
    go = true,
    cpp = true,
    c = true,
    java = true,
  },
  print_var_statements = {
    cpp = {
      "std::cout << %s << std::endl;",
    },
  },
})

vim.keymap.set(
  "v",
  "<leader>rr",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)

vim.keymap.set(
  "n",
  "<leader>ra",
  ":lua require('refactoring').debug.printf({below = false})<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<leader>rb",
  ":lua require('refactoring').debug.printf({below = true})<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<leader>rv",
  ":lua require('refactoring').debug.print_var({})<CR>",
  { noremap = true }
)
vim.keymap.set(
  "v",
  "<leader>rv",
  ":lua require('refactoring').debug.print_var({})<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<leader>rc",
  ":lua require('refactoring').debug.cleanup({})<CR>",
  { noremap = true }
)

vim.keymap.set(
  "n",
  "<leader>rB",
  [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
  { noremap = true, silent = true, expr = false }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>ri",
  [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  { noremap = true, silent = true, expr = false }
)
