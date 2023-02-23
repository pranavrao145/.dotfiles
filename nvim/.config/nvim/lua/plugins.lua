Packer_boostrap = nil
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
  -- Let Packer manage itself
  use("wbthomason/packer.nvim")

  -- Faster startup time
  use("lewis6991/impatient.nvim")

  -- LSP Config
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "ray-x/lsp_signature.nvim",
      "mfussenegger/nvim-jdtls",
      "j-hui/fidget.nvim", -- visual loader
    },
  })

  -- -- Auto-complete
  -- use({
  -- 	"ms-jpq/coq_nvim",
  -- 	branch = "coq",
  -- 	requires = {
  -- 		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
  -- 		{ "ms-jpq/coq.thirdparty", branch = "3p" },
  -- 	},
  -- })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-calc" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "onsails/lspkind-nvim" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "rafamadriz/friendly-snippets" },
      { "tzachar/cmp-tabnine", run = "./install.sh" },
    },
  })

  -- Status line
  -- use({
  -- "hoob3rt/lualine.nvim",
  -- requires = {
  -- { "kyazdani42/nvim-web-devicons" },
  -- { "ryanoasis/vim-devicons" },
  -- },
  -- })

  use({
    "tjdevries/express_line.nvim",
    requires = {
      { "kyazdani42/nvim-web-devicons" },
      { "ryanoasis/vim-devicons" },
      { "nvim-lua/plenary.nvim" },
    },
  })

  -- Bufferline
  -- use({
  -- "akinsho/nvim-bufferline.lua",
  -- requires = {
  -- { "kyazdani42/nvim-web-devicons" },
  -- { "ryanoasis/vim-devicons" },
  -- },
  -- })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "kyazdani42/nvim-web-devicons" },
      { "ryanoasis/vim-devicons" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  })

  -- Auto pairs
  -- use("jiangmiao/auto-pairs")

  -- Git integration
  use({ "tpope/vim-fugitive", requires = {
    "tpope/vim-rhubarb",
  } })

  -- GitHub integration
  use("pwntester/octo.nvim")
  use("ruifm/gitlinker.nvim")

  -- Git worktree
  use("ThePrimeagen/git-worktree.nvim")

  -- Rails plugins
  use({ "tpope/vim-rails", ft = { "rb", "erb" } })
  use({ "tpope/vim-bundler", ft = { "rb", "erb" } })

  -- Commenter
  use("numToStr/Comment.nvim")

  -- Emmet
  use({ "mattn/emmet-vim" })

  -- Multi cursor
  -- use({ "mg979/vim-visual-multi", branch = "master" })

  -- Buffer maximizer
  use("szw/vim-maximizer")

  -- Surround motions
  use("tpope/vim-surround")

  -- Debugger
  use({
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
    },
    opt = true,
  })

  -- Discord presence
  use("andweeb/presence.nvim")

  -- Better quickfix list
  use({
    "kevinhwang91/nvim-bqf",
    requires = {
      { "junegunn/fzf", run = "fzf#install()" },
    },
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "mfussenegger/nvim-treehopper",
    },
  })

  -- Context
  use({ "romgrk/nvim-treesitter-context" })

  -- Display colors for color codes
  use({ "norcalli/nvim-colorizer.lua", cmd = "ColorizerAttachToBuffer" })

  -- Netrw enhancement
  use("tpope/vim-vinegar")

  -- Unix helpers
  use("tpope/vim-eunuch")

  -- Harpoon
  use({
    "ThePrimeagen/harpoon",
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
  })

  -- Enhanced increment
  use("tpope/vim-speeddating")

  -- Dispatch
  use({ "tpope/vim-dispatch" })

  -- Dotenv
  use({ "tpope/vim-dotenv", cmd = { "Dotenv" } })

  -- Enhanced repeat
  use("tpope/vim-repeat")

  -- Enhanced common bindings
  use("tpope/vim-unimpaired")

  -- Database Interface and UI
  use({
    "tpope/vim-dadbod",
    requires = {
      { "kristijanhusak/vim-dadbod-ui", cmd = "DBUI" },
    },
    cmd = "DB",
  })

  -- Undo Tree
  -- use("mbbill/undotree")

  -- Smart replacements
  use("tpope/vim-abolish")

  -- Formatter
  use("sbdchd/neoformat")

  -- Tests
  -- use("vim-test/vim-test")

  -- Colors
  use("folke/lsp-colors.nvim")

  -- Refactoring library
  -- use({
  -- "ThePrimeagen/refactoring.nvim",
  -- requires = {
  -- { "nvim-lua/plenary.nvim" },
  -- { "nvim-treesitter/nvim-treesitter" },
  -- },
  -- })

  -- Markdown Preview
  use({ "iamcco/markdown-preview.nvim", run = function() end })

  -- Additional text objects
  use("wellle/targets.vim")

  -- Annotation toolkit
  use({
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  -- Symbols outline
  use({ "stevearc/aerial.nvim" })

  -- Git signs
  use({ "lewis6991/gitsigns.nvim" })

  -- Startup time monitor
  use({ "dstein64/vim-startuptime", cmd = { "StartupTime" } })

  -- LaTeX support
  use("lervag/vimtex")

  use({
    "kwkarlwang/bufresize.nvim",
  })

  -- Line endings
  use("tjdevries/cyclist.vim")

  -- Themes
  -- use("kyazdani42/nvim-palenight.lua")
  use("ellisonleao/gruvbox.nvim")
  -- use("Mofiqul/dracula.nvim")
  -- use("navarasu/onedark.nvim")
  -- use("shaunsingh/nord.nvim")
  -- use("sonph/onehalf")
  -- use("folke/tokyonight.nvim")
  -- use("luxed/ayu-vim")
  -- use("tjdevries/colorbuddy.vim")
  -- use("tjdevries/gruvbuddy.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
