local dap = require("dap")
dap.adapters.codelldb = {
  type = "server",
  port = 6969,
  executable = {
    -- CHANGE THIS to your path!
    command = "/home/cypher/.local/opt/codelldb/adapter/codelldb",
    args = { "--port", "6969" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
      )
    end,
    cwd = "${workspaceFolder}",
    args = {"./maps/uoft.txt"},
    stopOnEntry = true,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
