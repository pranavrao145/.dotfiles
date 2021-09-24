-- Setup harpoon

require("harpoon").setup({
    global_settings = {
        enter_on_sendcmd = true,
    },
    projects = {
        ["/home/cypher/Programming/todo-list/master"] = {
            term = {
                cmds = {
                    "yarn start",
                }
            }
        }
    }
})

vim.api.nvim_set_keymap('n', '<silent>\'\'', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'a', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'s', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'d', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'f', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'g', ':lua require("harpoon.ui").nav_file(5)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'h', ':lua require("harpoon.ui").nav_file(6)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'j', ':lua require("harpoon.ui").nav_file(7)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'k', ':lua require("harpoon.ui").nav_file(8)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'l', ':lua require("harpoon.ui").nav_file(9)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\';', ':lua require("harpoon.ui").nav_file(10)<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>t', ':lua require("harpoon.term").gotoTerminal(1)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent>\'t', ':lua require("harpoon.term").gotoTerminal(2)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>T', ':lua require("harpoon.term").gotoTerminal(3)<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader><Enter>', ':lua require("harpoon.term").sendCommand(1, 1)<CR>', { noremap = true })