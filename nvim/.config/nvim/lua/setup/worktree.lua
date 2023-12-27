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

local project_commands = {
  ["MARKUS"] = ":silent !tmux-windowizer %s /home/cypher/Programming/Markus/buildMarkus",
  ["JAVA"] = ":silent !tmux-windowizer %s ant",
  ["RUST"] = ":silent !tmux-windowizer %s cargo build",
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
