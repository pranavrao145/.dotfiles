vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'
  
  -- LSP Config
  use { 'neovim/nvim-lspconfig', requires = {
    { 'mfussenegger/nvim-jdtls' }
  }}

  -- Auto-complete
  use { 'hrsh7th/nvim-cmp', requires = {
          { 'hrsh7th/cmp-buffer' },
          { 'hrsh7th/cmp-path' },
          { 'hrsh7th/cmp-calc' },
          { 'hrsh7th/cmp-nvim-lsp' },
          { 'quangnguyen30192/cmp-nvim-ultisnips'},
          { 'SirVer/ultisnips' },
          { 'honza/vim-snippets' },
          { 'onsails/lspkind-nvim' },
      }
  }

  -- Status line
  use {
      'hoob3rt/lualine.nvim',
      requires = {
          { 'kyazdani42/nvim-web-devicons' },
          { 'ryanoasis/vim-devicons' }
      }
  }

  -- Bufferline
  use {
      'akinsho/nvim-bufferline.lua',
      requires = {
          { 'kyazdani42/nvim-web-devicons' },
          { 'ryanoasis/vim-devicons' }
      }
  }

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim',
      requires = {
          { 'kyazdani42/nvim-web-devicons' },
          { 'ryanoasis/vim-devicons' },
          { 'nvim-lua/popup.nvim' },
          { 'nvim-lua/plenary.nvim' },
          { 'nvim-telescope/telescope-fzy-native.nvim' },
          { 'nvim-telescope/telescope-project.nvim' },
          { 'ThePrimeagen/git-worktree.nvim' }
      }
  }

  -- Auto pairs
  use 'jiangmiao/auto-pairs'

  -- Git integration
  use 'tpope/vim-fugitive'

  -- Rails plugins
  use 'tpope/vim-rails'
  use 'tpope/vim-bundler'

  -- Commenter
  use 'preservim/nerdcommenter'

  -- Emmet
  use 'mattn/emmet-vim'

  -- Multi cursor
  use { 'mg979/vim-visual-multi', branch = 'master' }
  
  -- Buffer maximizer
  use 'szw/vim-maximizer'

  -- Surround motions
  use 'tpope/vim-surround'

  -- Debugger
  use 'puremourning/vimspector'

  -- Discord presence
  use 'andweeb/presence.nvim'

  -- Better quickfix list
  use { 'kevinhwang91/nvim-bqf', requires = {
      { 'junegunn/fzf', run = 'fzf#install()' }
  } }
  use { 'Olical/vim-enmasse' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Display colors for color codes
  use 'norcalli/nvim-colorizer.lua'

  -- Netrw enhancement
  use 'tpope/vim-vinegar'

  -- Unix helpers
  use 'tpope/vim-eunuch'

  -- Harpoon
  use { 'ThePrimeagen/harpoon', requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' }
  } }

  -- Enhanced increment
  use 'tpope/vim-speeddating'

  -- Dispatch
  use 'tpope/vim-dispatch'

  -- Dotenv
  use 'tpope/vim-dotenv'

  -- Enhanced repeat
  use 'tpope/vim-repeat'

  -- Undo Tree
  use 'mbbill/undotree'

  -- Smart replacements
  use 'tpope/vim-abolish'

  -- Tests
  use 'vim-test/vim-test'

  -- JDTLS (Java language server)
  use 'mfussenegger/nvim-jdtls'

  -- Colors
  use 'folke/lsp-colors.nvim'

  -- Themes
  use 'drewtempelmeyer/palenight.vim'
  use 'rafi/awesome-vim-colorschemes'
  use { 'kaicataldo/material.vim', branch = 'main' }
  use { 'dracula/vim', as = 'dracula' }
end)
