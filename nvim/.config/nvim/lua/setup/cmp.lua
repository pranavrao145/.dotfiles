-- Setup nvim-cmp for autocompletion
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "path" },
		{ name = "calc" },
		{ name = "buffer" },
	},
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	formatting = {
		format = require("lspkind").cmp_format({
			with_text = true,
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				ultisnips = "[UltiSnips]",
				path = "[Path]",
				calc = "[Calc]",
			},
		}),
	},
	mapping = {
		["<C-q>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.complete(),
	},
	preselect = "none",
})
