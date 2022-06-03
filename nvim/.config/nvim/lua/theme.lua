-- Set italics
vim.g.palenight_terminal_italics = 1
vim.g.gruvbox_italic = 1
vim.g.gruvbox_bold = 1
vim.g.material_terminal_italics = 1
vim.g.dracula_italic = 1
vim.g.nord_italic = 1
vim.g.onehalf_italic = 1

-- Set colorscheme
vim.cmd("colorscheme gruvbox")

-- transparent background and get rid of unneccessary fills
vim.cmd([[
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi CursorLineNr guibg=NONE ctermbg=NONE
    " hi WinSeparator guibg=NONE ctermbg=NONE

    hi TelescopeNormal guibg=NONE ctermbg=NONE
    hi! link NonText Comment

    " Needed for palenight
    " hi ColorColumn guibg=#2C323C ctermbg=236
]])
