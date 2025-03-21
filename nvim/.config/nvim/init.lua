-- require("plenary.profile").start("/home/cypher/profile.log", { flame = true })

-- Improve startup time
require("impatient")

-- load vim options
require("options")

-- load plugins
require("plugins")

-- load LSP and completion
-- require("setup.coq")
require("lsp")

-- load theme
require("theme")

-- load all custom keymaps
require("keymaps")

-- load all project-specific requirements
require("projects")

-- load config for all plugins
require("setup.cmp")
require("setup.fugitive")
require("setup.maximizer")
require("setup.comment")
require("setup.rails")
require("setup.telescope")
require("setup.treesitter")
-- require("setup.vimspector")
require("setup.dap-setup")
require("setup.worktree")
require("setup.lualine")
-- require("setup.bufferline")
require("setup.harpoon")
-- require("setup.test")
-- require("setup.undotree")
require("setup.dispatch")
require("setup.neoformat")
require("setup.luasnip")
require("setup.refactoring")
-- require("setup.lsp-signature")
require("setup.firenvim")
require("setup.cmp-tabnine")
require("setup.bqf")
require("setup.neogen")
require("setup.treesitter-context")
require("setup.gitsigns")
-- require("setup.express-line")
require("setup.fidget")
require("setup.treehopper")
require("setup.octo")
require("setup.gitlinker")
require("setup.vimtex")
require("setup.bufresize")
require("setup.aerial")
require("setup.autopairs")
require("setup.sourcegraph")
require("setup.indentation_lines")
-- require("setup.eyeliner")
require("setup.mdpreview")
require("setup.todo-comments")
require("setup.oil")
require("setup.lspsaga")
require("setup.dressing")

-- require('plenary.profile').stop()
