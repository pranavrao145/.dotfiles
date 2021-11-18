-- netup remaps for refactoring.nvim

-- Create a global object so maps can access certain functions
M = {}

-- Telescope refactoring helper
local function refactor(prompt_bufnr)
	local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
	require("telescope.actions").close(prompt_bufnr)
	require("refactoring").refactor(content.value)
end

M.refactors = function()
	local opts = require("telescope.themes").get_cursor()
	require("telescope.pickers").new(opts, {
		prompt_title = "refactors",
		finder = require("telescope.finders").new_table({
			results = require("refactoring").get_refactors(),
		}),
		sorter = require("telescope.config").values.generic_sorter(opts),
		attach_mappings = function(_, map)
			map("i", "<CR>", refactor)
			map("n", "<CR>", refactor)
			return true
		end,
	}):find()
end

vim.api.nvim_set_keymap("v", "<leader>r", "<Esc><cmd>lua M.refactors()<CR>", { noremap = true })
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
