local outline = require("outline")

outline.setup()

vim.keymap.set("n", "<leader>os", function ()
    outline.toggle()
end, { noremap = true })
