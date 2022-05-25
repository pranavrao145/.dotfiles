-- Auto start coq

vim.g.coq_settings = {
	["auto_start"] = "shut-up",
	["keymap.manual_complete"] = "<C-s>",
	["clients.tabnine.enabled"] = true,
}

require("coq_3p")({
	{ src = "nvimlua", short_name = "nLUA" },
	{
		src = "repl",
		sh = "zsh",
	},
	{ src = "bc", short_name = "MATH", precision = 6 },
	{ src = "vim_dadbod_completion", short_name = "DB" },
})
