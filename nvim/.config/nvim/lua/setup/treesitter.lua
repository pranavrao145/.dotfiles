-- ====================================================================
-- 1. NVIM-TREESITTER (Main Branch Parser Management & Highlighting)
-- ====================================================================

-- Start native Treesitter highlighting on buffer load
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if vim.bo[args.buf].filetype == "latex" then
      return
    end
    pcall(vim.treesitter.start)
  end,
})

-- Native Incremental Selection Keymaps
vim.keymap.set("n", "gnn", function() vim.treesitter.incremental_selection.init_selection() end, { desc = "Init selection" })
vim.keymap.set("x", "gni", function() vim.treesitter.incremental_selection.node_incremental() end, { desc = "Increment node" })
vim.keymap.set("x", "gsi", function() vim.treesitter.incremental_selection.scope_incremental() end, { desc = "Increment scope" })
vim.keymap.set("x", "gnd", function() vim.treesitter.incremental_selection.node_decremental() end, { desc = "Decrement node" })

-- ====================================================================
-- 2. TEXTOBJECTS SETUP
-- ====================================================================
local status, textobjects = pcall(require, "nvim-treesitter-textobjects")
if status then
  textobjects.setup({
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>pn"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>pp"] = "@parameter.inner",
      },
    },
  })
end

-- ====================================================================
-- 3. UTILITIES & INSPECTOR
-- ====================================================================

vim.g.skip_ts_context_commentstring_module = true

-- Replaces TSPlaygroundToggle with Neovim's built-in AST Inspector
vim.keymap.set("n", "<leader>pP", "<cmd>InspectTree<CR>", { desc = "Toggle Treesitter AST Inspector" })
