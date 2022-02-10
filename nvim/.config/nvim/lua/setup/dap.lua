-- Setup for debugging each language
require("setup.nvim-dap.cpp")
require("setup.nvim-dap.python")
require("setup.nvim-dap.go")
require("setup.nvim-dap.java")

-- Maps
vim.api.nvim_set_keymap("n", "<leader>dc", ":lua require('dap').continue()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>do", ":lua require('dap').step_over()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>di", ":lua require('dap').step_into()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dO", ":lua require('dap').step_out()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>dbc",
	":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>dbl",
	":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dap').repl.toggle()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dl", ":lua require('dap').run_last()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>de", ":lua require('dap').terminate()<CR>", { noremap = true })
