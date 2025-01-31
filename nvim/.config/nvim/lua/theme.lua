-- require("colorbuddy").setup()

-- Set italics
vim.g.palenight_terminal_italics = 1
vim.g.gruvbox_italic = 1
vim.g.gruvbox_bold = 1
vim.g.material_terminal_italics = 1
vim.g.dracula_italic = 1
vim.g.nord_italic = 1
vim.g.onehalf_italic = 1
vim.g.ayu_italic_comment = 1

-- set up colorscheme, if necessary
-- require("setup.tokyonight")
-- require("setup.gruvbox")
-- require("setup.catppuccin")
-- require("setup.vague")

-- Set colorscheme
vim.cmd("colorscheme dracula")
-- require("colorbuddy").colorscheme("colorbuddy")

-- transparent background and get rid of unneccessary fills
vim.cmd([[
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi CursorLineNr guibg=NONE ctermbg=NONE
    " hi WinSeparator guibg=NONE ctermbg=NONE

    " needed for dracula
    hi TelescopeNormal guibg=NONE ctermbg=NONE
    hi! link NonText Comment

    " Needed for gruvbuddy
    " hi ColorColumn guibg=#2C323C ctermbg=236

    " needed for gruvbuddy
    " hi IblIndent guifg=#373e4b
    " hi IblScope guifg=#8e6fbd

    " needed for palenight
    " hi IblIndent guifg=#4e5579
    " hi IblScope guifg=#a6accd
]])


-- require("setup.wal_theme")
