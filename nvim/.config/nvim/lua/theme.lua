-- Set colorscheme
vim.cmd("colorscheme iceberg")

-- transparent background and get rid of unneccessary fills
vim.cmd([[
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi CursorLineNr guibg=NONE ctermbg=NONE
]])
