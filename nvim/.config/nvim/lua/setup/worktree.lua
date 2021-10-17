-- Setup remaps for git worktree

local worktree = require("git-worktree")

worktree.setup{}

vim.api.nvim_set_keymap('n', '<leader>gw', ':lua require(\'telescope\').extensions.git_worktree.git_worktrees()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ga', ':lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>', { noremap = true })

local function is_ruby()
    return vim.env["RUBY"]
end

local function is_node()
    return vim.env["NODE"]
end

local function is_docker()
    return vim.env["DOCKER"]
end

worktree.on_tree_change(function(op, metadata)
    -- get the path of the new worktree directory
    local path = metadata["path"]

    if op == worktree.Operations.Switch then
        if is_ruby() then
            local command = string.format(":silent !tmux-windowizer %s bundle", path)
            vim.cmd(command)
        end

        if is_node() then
            local command = string.format(":silent !tmux-windowizer %s yarn", path)
            vim.cmd(command)
        end

        if is_docker() then
            local command = string.format(":silent !tmux-windowizer %s docker-compose build", path)
            vim.cmd(command)
        end
    end
end)
