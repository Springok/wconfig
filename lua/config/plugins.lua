local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

return packer.startup(function()
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use { "akinsho/bufferline.nvim", tag = "v2.*"}
  use 'nvim-lualine/lualine.nvim'
  use "moll/vim-bbye"

  use 'lewis6991/impatient.nvim'

  use "ssh://git@gitlab.abagile.com:7788/chiao.chuang/vim-abagile.git"

  -- Navigation
  use 'tpope/vim-projectionist'
  use 'tpope/vim-unimpaired'
  use 'simrat39/symbols-outline.nvim'

  -- Indent
  use 'austintaylor/vim-indentobject'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('indent_blankline').setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }

  -- Commenting
  -- use 'tomtom/tcomment_vim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use "nvim-treesitter/playground"
  use "p00f/nvim-ts-rainbow"

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

    -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use {
    'seblj/nvim-echo-diagnostics',
    config = function()
      require("echo-diagnostics").setup{
        show_diagnostic_number = true,
        show_diagnostic_source = false,
      }
    end
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim"


  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Git
  use "lewis6991/gitsigns.nvim"
  use 'tpope/vim-fugitive' -- Git commands

  -- Ruby
  use {'tpope/vim-rails', ft = "ruby" } -- only load when opening Ruby file
  use 'tpope/vim-bundler'

  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use "tpope/vim-endwise"
  use 'junegunn/vim-easy-align'
  use 'pedrohdz/vim-yaml-folds'

  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-tmux-runner'

  use {'Mofiqul/vscode.nvim', branch = 'main' }
  use 'navarasu/onedark.nvim'
  use 'folke/tokyonight.nvim'
  use {'marko-cerovac/material.nvim', branch = 'main'}
  -- use "projekt0n/github-nvim-theme"

  -- Clojure, Lisp
  use "gpanders/nvim-parinfer"
  use "guns/vim-sexp"
  use "tpope/vim-sexp-mappings-for-regular-people"
  use 'Olical/conjure'
  use 'clojure-vim/vim-jack-in'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
