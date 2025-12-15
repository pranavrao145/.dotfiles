require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
require("copilot_cmp").setup({})

require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "copilot",
      model = "gpt-5-mini",
    },
    inline = {
      adapter = "copilot",
      model = "gpt-5-mini",
    },
    cmd = {
      adapter = "copilot",
      model = "gpt-5-mini",
    },
  },
})


vim.keymap.set("n", "<leader>oa", "<cmd>CodeCompanionChat<CR>", { noremap = true })
