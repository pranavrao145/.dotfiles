local lsp = require("lsp")

-- Sourcegraph
require("sg").setup({
  on_attach = lsp.on_attach,
})


vim.keymap.set("n", "<C-S-p>", ":lua require('sg.extensions.telescope').fuzzy_search_results()<CR>", { noremap = true })
