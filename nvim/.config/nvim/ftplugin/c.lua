vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("automake-c", { clear = true }),
  pattern = "*.c",
  callback = function()
    vim.fn.system({ "make" })
    -- vim.fn.jobstart("make", {
    --   on_stderr = function()
    --     print("Auto-compile failed with errors/warnings")
    --   end,
    -- })
  end,
})
