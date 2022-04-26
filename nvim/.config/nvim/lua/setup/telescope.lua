-- Setup Telescope for fuzzy finding

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--hidden",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		mappings = {
			i = {
				["<C-q>"] = require("telescope.actions").smart_send_to_qflist,
			},
			n = {
				["<C-q>"] = require("telescope.actions").smart_send_to_qflist,
				["<C-a>"] = require("telescope.actions").select_all,
				["<C-s>"] = require("telescope.actions").toggle_selection,
				["<C-d>"] = require("telescope.actions").drop_all,
			},
		},
		-- only_sort_text = true,
		color_devicons = true,
		layout_config = {
			prompt_position = "top",
		},
	},

	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("refactoring")

vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>gc",
	"<cmd>lua require('telescope.builtin').git_commits()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gv",
	"<cmd>lua require('telescope.builtin').git_bcommits()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gb",
	"<cmd>lua require('telescope.builtin').git_branches()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	"<cmd>lua require('telescope.builtin').grep_string()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>ls",
	"<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>lw",
	":lua require('telescope.builtin').lsp_workspace_symbols({ query = '' })<left><left><left><left>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>lD",
	"<cmd>lua require('telescope.builtin').diagnostics({ bufnr = 0 })<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>lW",
	"<cmd>lua require('telescope.builtin').diagnostics()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>?", "<cmd>lua require('telescope.builtin').help_tags()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>/",
	"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>oo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>D", ":CmpStatus test<CR>", {})
