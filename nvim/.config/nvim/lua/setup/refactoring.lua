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

vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>ra",
	":lua require('refactoring').debug.printf({below = false})<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>rb",
	":lua require('refactoring').debug.printf({below = true})<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("v", "<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>rB",
	[[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
