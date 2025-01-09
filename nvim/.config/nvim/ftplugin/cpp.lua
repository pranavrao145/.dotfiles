vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("automake-cpp", { clear = true }),
  pattern = "*.cpp",
  callback = function()
    vim.fn.system({ "make" })
    -- vim.fn.jobstart("make", {
    --   on_stderr = function()
    --     print("Auto-compile failed with errors/warnings")
    --   end,
    -- })
  end,
})
