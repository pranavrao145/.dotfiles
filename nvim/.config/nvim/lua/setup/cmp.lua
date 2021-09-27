-- Setup nvim-cmp for autocompletion
local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'path' },
        { name = 'calc' },
    },
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                ultisnips = "[UltiSnips]",
                path = "[Path]",
                calc = "[Calc]",
            })[entry.source.name]
            return vim_item
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
        ['<C-s>'] = cmp.mapping.complete()
    },
    preselect = "none"
})
