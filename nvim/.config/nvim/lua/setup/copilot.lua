-- GitHub Copilot & Autocompletion Setup
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
require("copilot_cmp").setup({})

-- CodeCompanion Setup
require("codecompanion").setup({
  adapters = {
    http = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gpt-5-mini",
              choices = {
                ["gpt-5-mini"] = { opts = { can_reason = false } },
              },
            },
          },
        })
      end,
    },
  },
  strategies = {
    chat = {
      adapter = "copilot",
      keymaps = {
        close = {
          modes = {
            n = "<nop>", -- Disables Ctrl+C in Normal mode
            i = "<nop>", -- Disables Ctrl+C in Insert mode
          },
        },
      },
    },
    inline = {
      adapter = "copilot",
    },
    cmd = {
      adapter = "copilot",
    },
  },
})

-- Global Keybindings
vim.keymap.set(
  "n",
  "<leader>oa",
  "<cmd>CodeCompanionChat<CR>",
  { noremap = true, silent = true }
)
