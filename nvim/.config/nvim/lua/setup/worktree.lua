-- Setup remaps for git worktree

local worktree = require("git-worktree")

worktree.setup({})

vim.api.nvim_set_keymap(
	"n",
	"<leader>gw",
	":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ga",
	":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
	{ noremap = true }
)

local project_commands = {
	["DOCKER"] = ":silent !tmux-windowizer %s docker-compose build",
	["JAVA"] = ":silent !tmux-windowizer %s ant",
}

worktree.on_tree_change(function(op, metadata)
	-- get the path of the new worktree directory
	local path = metadata["path"]

	if op == worktree.Operations.Switch then
		for project_type, _ in pairs(project_commands) do
			if vim.env[project_type] then
				vim.cmd(string.format(project_commands[project_type], path))
			end
		end
	end
end)
