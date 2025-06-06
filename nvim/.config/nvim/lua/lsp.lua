local nvim_lsp = require("lspconfig")
-- local coq = require("coq")
-- local lsp_signature = require("lsp_signature")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local jdtls = require("jdtls")
local jdtls_setup = require("jdtls.setup")

local M = {}

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Set up LSP signature
  -- lsp_signature.on_attach()

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>gi",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<leader>wa",
    "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<leader>wr",
    "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<leader>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  buf_set_keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>gh",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    opts
  )
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>a",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    opts
  )
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>ld",
    "<cmd>lua vim.diagnostic.open_float()<CR>",
    opts
  )
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>q",
    "<cmd>lua vim.diagnostic.setloclist()<CR>",
    opts
  )
  -- buf_set_keymap('n', "<leader>fm", '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
end

-- Export on attach
M.on_attach = on_attach

-- Typescript and Javascript
nvim_lsp.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- C and C++
nvim_lsp.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Python
-- nvim_lsp.pylsp.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = { "E501" },
--         },
--       },
--     },
--   },
-- })
--
-- nvim_lsp.ruff.setup({ on_attach = on_attach, capabilities = capabilities })

nvim_lsp.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Ruby
nvim_lsp.solargraph.setup({
  cmd = { "solargraph", "stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Golang
nvim_lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Java
M.get_jdtls_config = function()
  local bundles = {
    vim.fn.glob(
      "/home/cypher/.local/opt/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
    ),
  }
  vim.list_extend(
    bundles,
    vim.split(
      vim.fn.glob("/home/cypher/.local/opt/vscode-java-test/server/*.jar"),
      "\n"
    )
  )
  return {
    cmd = {
      "/usr/bin/jdtls",
    },
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
    settings = {
      java = {},
    },
    capabilities = capabilities,
    on_attach = function(_, bufnr)
      jdtls_setup.add_commands()
      jdtls.update_project_config()
      on_attach(_, bufnr)
    end,
    init_options = {
      bundles = bundles,
    },
  }
end

-- Lua
nvim_lsp.lua_ls.setup({
  cmd = { "lua-language-server" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "use" },
        telemetry = { enable = false },
      },
    },
  },
})

-- Haskell
nvim_lsp.hls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern(
    "*.cabal",
    "stack.yaml",
    "cabal.project",
    "package.yaml",
    "hie.yaml",
    ".git"
  ),
})

-- C#
nvim_lsp.omnisharp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "/home/cypher/.local/opt/omnisharp/run",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid()),
  },
  root_dir = nvim_lsp.util.root_pattern(".sln", ".csproj", ".git"),
})

-- Rust
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern(
    "Cargo.toml",
    "rust-project.json",
    ".git"
  ),
})

-- Elixir/Erlang
nvim_lsp.elixirls.setup({
  cmd = { "/usr/bin/elixir-ls" },
  on_attach = on_attach,
  capabilities = capabilities,
})

-- LaTeX
nvim_lsp.texlab.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- SQL
-- nvim_lsp.sqlls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- GLSL
nvim_lsp.glsl_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

return M
