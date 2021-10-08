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
        },
        ["/home/cypher/Programming/comp-eng/lesson6"] = {
            term = {
                cmds = {
                    "clang-format -i lesson6.ino"
                }
            }
        },
        ["/home/cypher/Programming/comp-eng/lesson5Modified"] = {
            term = {
                cmds = {
                    "clang-format -i lesson5Modified.ino"
                }
            }
        },
    }
})

-- Harpoon mark commands
vim.cmd([[
    nnoremap <leader>' :lua require("harpoon.mark").add_file()<CR>
    nnoremap <silent>'a :lua require("harpoon.ui").nav_file(1)<CR>
    nnoremap <silent>'s :lua require("harpoon.ui").nav_file(2)<CR>
    nnoremap <silent>'d :lua require("harpoon.ui").nav_file(3)<CR>
    nnoremap <silent>'f :lua require("harpoon.ui").nav_file(4)<CR>
    nnoremap <silent>'g :lua require("harpoon.ui").nav_file(5)<CR>
    nnoremap <silent>'h :lua require("harpoon.ui").nav_file(6)<CR>
    nnoremap <silent>'j :lua require("harpoon.ui").nav_file(7)<CR>
    nnoremap <silent>'k :lua require("harpoon.ui").nav_file(8)<CR>
    nnoremap <silent>'l :lua require("harpoon.ui").nav_file(9)<CR>
    nnoremap <silent>'; :lua require("harpoon.ui").nav_file(10)<CR>

    nnoremap <silent>'t :lua require("harpoon.term").gotoTerminal(2)<CR>
]])

-- Other maps (terminal, ui, etc)
vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>t', ':lua require("harpoon.term").gotoTerminal(1)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>T', ':lua require("harpoon.term").gotoTerminal(3)<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader><Enter>', ':lua require("harpoon.term").sendCommand(1, 1)<CR>', { noremap = true })

-- Autocmds
vim.cmd([[
    autocmd FileType harpoon nnoremap <buffer> <silent> q :wq<CR>
]])
