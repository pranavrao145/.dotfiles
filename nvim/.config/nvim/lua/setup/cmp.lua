-- Setup nvim-cmp for autocompletion
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match("%s")
      == nil
end

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "cmp_tabnine" },
    -- { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "path" },
    { name = "calc" },
    { name = "buffer" },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = require("lspkind").cmp_format({
      with_text = true,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        -- nvim_lua = "[LSP]",
        cmp_tabnine = "[TN]",
        luasnip = "[LuaSnip]",
        path = "[Path]",
        calc = "[Calc]",
      },
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-q>"] = cmp.mapping.confirm({ select = true }),
    ["<C-s>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),
  preselect = "",
  view = {
    entries = "custom",
  },
  experimental = {
    ghost_text = true,
  },
})

-- Integrate cmp with autopairs
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- setup cmp theme
vim.cmd([[
    hi CmpItemAbbrMatch gui=bold
    hi CmpItemAbbrMatchFuzzy gui=bold
]])
