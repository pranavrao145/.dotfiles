-- Setup a load function for the debugger, should it need to be loaded
local jdtls = require("jdtls")

local setup_debugger = function()
  require("setup.dap")
  require("setup.dap-ui")
  require("setup.dap-virtual-text")

  jdtls.setup_dap({ hotcodereplace = "auto" })
end

-- ENABLE FOR MANUAL LOAD
-- vim.keymap.set("n", "<leader>dl", function()
--   vim.cmd("PackerLoad nvim-dap")
--   setup_debugger()
-- end, { noremap = true })

-- ENABLE FOR AUTO LOAD
local debugger_group =
  vim.api.nvim_create_augroup("DebuggerLoad", { clear = true })

vim.api.nvim_create_autocmd("BufNew", {
  callback = function()
    setup_debugger()
  end,
  group = debugger_group,
  pattern = "*",
})
