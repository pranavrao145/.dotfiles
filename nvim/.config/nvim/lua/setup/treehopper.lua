vim.cmd([[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]])
vim.cmd([[vnoremap <silent> m :lua require('tsht').nodes()<CR>]])
