-- Setup treesitter for better syntax highlighting

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
})
