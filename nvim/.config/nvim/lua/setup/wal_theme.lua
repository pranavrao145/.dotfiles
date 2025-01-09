local Color = require("colorbuddy").Color
local Group = require("colorbuddy").Group
local colors = require("colorbuddy").colors
local styles = require("colorbuddy").styles

Color.new("color14", "#E95D54")
Color.new("color2", "#565858")
Color.new("color11", "#9B2932")
Color.new("foreground", "#f1c8a8")
Color.new("comment_grey", "#797979")

assert(colors ~= nil)

Group.new("Special", colors.color14)
Group.new("Directory", colors.color14)
Group.new("QuickfixLine", colors.color2)
Group.new("Function", colors.color2, nil)
Group.new("Identifier", colors.color2)
Group.new("Operator", colors.color2)
Group.new("Delimiter", colors.color2)
-- Group.new("DiffAdd", colors.foreground, colors.color2:dark():dark())
Group.new("PreProc", colors.color14)
Group.new("Type", colors.color14)
Group.new("Keyword", colors.color11, nil, styles.bold)
Group.new("Comment", colors.comment_grey, nil, styles.italic)
Group.new("IblIndent", colors.comment_grey:dark():dark():dark():dark())
Group.new("IblScope", colors.color2:light():light():light())
vim.api.nvim_set_hl(0, "Character", { link = "String" })
-- because latex is quirky
Group.new("texCmd", colors.color2, nil, styles.italic)
