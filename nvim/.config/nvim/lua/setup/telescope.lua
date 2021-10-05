-- Setup Telescope for fuzzy finding

require('telescope').setup {
    defaults = {
        file_sorter =  require'telescope.sorters'.get_fzy_sorter,
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        mappings = {
            i = {
                ["<C-q>"] = require("telescope.actions").smart_send_to_qflist,
            },
            n = {
                ["<C-q>"] = require("telescope.actions").smart_send_to_qflist,
                ["<C-a>"] = require("telescope.actions").select_all,
                ["<C-s>"] = require("telescope.actions").toggle_selection,
                ["<C-d>"] = require("telescope.actions").drop_all,
            },
        },
        only_sort_text = true,
        color_devicons= true,
        layout_config = {
            prompt_position = "top"
        }
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('project')
require('telescope').load_extension("git_worktree")

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope git_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gv', '<cmd>Telescope git_bcommits<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope grep_string<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lw', '<cmd>Telescope lsp_workspace_diagnostics<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lD', '<cmd>Telescope lsp_document_diagnostics<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>P', '<cmd>Telescope project<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>H', '<cmd>Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { noremap = true })
