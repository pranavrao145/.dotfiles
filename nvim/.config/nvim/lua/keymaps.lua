-- Set all custom keymaps

-- Quickfix maps
vim.cmd([[
    function! ToggleQuickfixList()
        if empty(filter(getwininfo(), 'v:val.quickfix'))
            copen
        else
            cclose
        endif
    endfunction

    function! ToggleLocationList()
        if empty(filter(getwininfo(), 'v:val.loclist'))
            lopen
        else
            lclose
        endif
    endfunction

    nnoremap <C-q> :call ToggleQuickfixList()<CR>
    nnoremap <C-j> :cnext<CR>
    nnoremap <C-k> :cprev<CR>

    nnoremap <leader>q :call ToggleLocationList()<CR>
    nnoremap <leader>j :lnext<CR>
    nnoremap <leader>k :lprev<CR>
]])

-- Misc maps
vim.keymap.set("n", "<leader>s", ":w!<CR>", { noremap = true })
vim.keymap.set("n", "<leader>o", ":source %<CR>", { noremap = true })
vim.keymap.set("n", "<leader>O", ":source ~/.config/nvim/init.lua<CR>", { noremap = true })
vim.keymap.set("n", "<leader>e", ":e!<CR>", { noremap = true })
vim.keymap.set("n", "<leader>E", ":Explore<CR>", { noremap = true })
vim.keymap.set("n", "<leader>A", "<Esc>gg <bar> V <bar> G", { noremap = true })

-- Semicolon remaps
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })
vim.keymap.set("v", ":", ";", { noremap = true })

-- Escape remaps
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

-- Void paste remap
vim.keymap.set("v", "<leader>p", '"_dP', { noremap = true })

-- Void delete remap
vim.keymap.set("v", "<leader>d", '"_x', { noremap = true })

-- Use system clipboard map
vim.keymap.set("n", "<leader>P", ":set clipboard=unnamedplus<CR>", { noremap = true })

-- Visual mode next result remap
vim.cmd([[
    vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
]])

-- Find and replace all occurences
vim.cmd([[
    nnoremap <leader>f /\<\><left><left>
    nnoremap <leader>frr :%s/\<<C-r><C-w>\>//g<left><left>
]])

-- Terminal mode remaps
vim.keymap.set("t", "kj", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true })

-- CopyBuffer command
vim.api.nvim_command("command! CopyBuffer let @+ = expand('%:p')")

-- Special changes to default remaps to make more sense
vim.keymap.set("n", "Y", "y$", { noremap = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })

-- Undo breakpoints
vim.keymap.set("i", ",", ",<c-g>u", { noremap = true })
vim.keymap.set("i", ".", ".<c-g>u", { noremap = true })
vim.keymap.set("i", "!", "!<c-g>u", { noremap = true })
vim.keymap.set("i", "?", "?<c-g>u", { noremap = true })

-- Copy to system clipboard maps
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { noremap = true })

-- Change to executable map
vim.keymap.set("n", "<leader>x", ":silent !chmod +x %<CR>", { noremap = true })
vim.keymap.set("n", "<leader>X", ":silent !chmod -x %<CR>", { noremap = true })

-- Visual mode move line maps
vim.cmd([[
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv
]])

-- Register movement points more often
vim.cmd([[
    nnoremap <expr> k (v:count > 2 ? "m'" . v:count : "") . 'k'
    nnoremap <expr> j (v:count > 2 ? "m'" . v:count : "") . 'j'
]])

vim.cmd([[
    augroup BUFFER_RESET
        autocmd!
        autocmd FileType arduino :nnoremap <leader>lr :bd <bar> :lua require('harpoon.ui').nav_file(1)<CR>
    augroup END
]])
