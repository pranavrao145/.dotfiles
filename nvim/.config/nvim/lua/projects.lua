-- get CWD
local cwd = vim.loop.cwd()

-- set vim env depending on cwd
local projects = {
  -- ["Markus"] = "MARKUS",
}

for project, _ in pairs(projects) do
  if string.find(cwd, project, 0, true) then
    vim.env[projects[project]] = true
  end
end
