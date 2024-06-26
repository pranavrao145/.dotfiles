require("colorbuddy").setup()

local Color = require("colorbuddy").Color
local Group = require("colorbuddy").Group
local colors = require("colorbuddy").colors
local styles = require("colorbuddy").styles

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

-- Set colorscheme
-- vim.cmd("colorscheme onedark")
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

    " needed for palenight and dracula
    " hi TelescopeNormal guibg=NONE ctermbg=NONE
    " hi! link NonText Comment

    " Needed for palenight and gruvbuddy
    " hi ColorColumn guibg=#2C323C ctermbg=236

    " needed for gruvbuddy
    " hi IblIndent guifg=#373e4b
    " hi IblScope guifg=#8e6fbd
]])

Color.new("color14", "#A6915E")
Color.new("color2", "#906733")
Color.new("color11", "#C76A38")
Color.new("foreground", "#ddcf9d")
Color.new("comment_grey", "#A9A9A9")

assert(colors ~= nil)

Group.new("Special", colors.color14)
Group.new("Directory", colors.color14)
Group.new("QuickfixLine", colors.color2)
Group.new("Function", colors.color2, nil)
Group.new("Identifier", colors.color2)
-- Group.new("DiffAdd", colors.foreground, colors.color2:dark():dark())
Group.new("PreProc", colors.color14)
Group.new("Type", colors.color14)
Group.new("Keyword", colors.color11, nil, styles.bold)
Group.new("Comment", colors.comment_grey, nil, styles.italic)
vim.api.nvim_set_hl(0, "Character", { link = "String" })

-- because latex is quirky
Group.new("texCmd", colors.color2, nil, styles.italic)
