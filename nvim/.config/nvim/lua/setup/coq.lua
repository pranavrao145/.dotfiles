-- Auto start coq

vim.g.coq_settings = {
  ["auto_start"] = "shut-up",
  ["keymap.manual_complete"] = "<C-s>",
  ["clients.tabnine.enabled"] = true,
  ["keymap.jump_to_mark"] = "<Tab>",
}

-- this was taken verbatim from the docs and I don't want to change it
vim.cmd([[
    ino <silent><expr> <C-q>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
]])

require("coq_3p")({
  { src = "nvimlua", short_name = "nLUA" },
  {
    src = "repl",
    sh = "zsh",
  },
  { src = "bc", short_name = "MATH", precision = 6 },
  { src = "vim_dadbod_completion", short_name = "DB" },
})
