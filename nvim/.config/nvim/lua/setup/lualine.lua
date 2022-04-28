require("lualine").setup({
	options = {
		theme = "palenight",
		section_separators = "",
		component_separators = "",
	},
	extensions = {
		"quickfix",
		"fugitive",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
