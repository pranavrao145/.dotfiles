require("treesitter-context").setup({})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local buftype = vim.bo.buftype
    local filetype = vim.bo.filetype

    if buftype == "nofile" or filetype == "fugitive" or vim.wo.diff then
      require("treesitter-context").disable()
    else
      require("treesitter-context").enable()
    end
  end,
})
