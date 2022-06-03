-- Setup a load function for the debugger, should it need to be loaded
local jdtls = require("jdtls")

local setup_debugger = function()
  require("setup.dap")
  require("setup.dap-ui")
  require("setup.dap-virtual-text")

  jdtls.setup_dap({ hotcodereplace = "auto" })
end

vim.keymap.set("n", "<leader>dl", function()
  vim.cmd("PackerLoad nvim-dap")
  setup_debugger()
end, { noremap = true })
