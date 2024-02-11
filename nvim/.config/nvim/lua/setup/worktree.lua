-- Setup remaps for git worktree

local worktree = require("git-worktree")

worktree.setup({})

vim.keymap.set(
  "n",
  "<leader>gw",
  ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<leader>ga",
  ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
  { noremap = true }
)

local worktree_create_commands = {
  ["MARKUS"] = ":silent !tmux-windowizer %s /home/cypher/Programming/Markus/buildMarkus",
}

local worktree_cleanup_commands = {
  ["MARKUS"] = ":silent !tmux-windowizer %s /home/cypher/Programming/Markus/cleanupMarkus",
}

worktree.before_tree_change(function(op, metadata)
  -- get the path of the worktree directory to be deleted
  local path = metadata["path"]

  if op == worktree.Operations.Delete then
    for project_type, _ in pairs(worktree_cleanup_commands) do
      if vim.env[project_type] then
        vim.cmd(string.format(worktree_cleanup_commands[project_type], path))
      end
    end
  end
end)

worktree.on_tree_change(function(op, metadata)
  -- get the path of the new worktree directory
  local path = metadata["path"]

  if op == worktree.Operations.Create then
    for project_type, _ in pairs(worktree_create_commands) do
      if vim.env[project_type] then
        vim.cmd(string.format(worktree_create_commands[project_type], path))
      end
    end
  end
end)
