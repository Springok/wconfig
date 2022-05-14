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
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function()
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Commenting
  -- use 'tomtom/tcomment_vim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Highlights
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   requires = {
  --     'nvim-treesitter/nvim-treesitter-refactor',
  --     'RRethy/nvim-treesitter-textsubjects',
  --   },
  --   run = '<cmd>TSUpdate'
  -- }

  -- common
  use 'tpope/vim-fugitive' -- Git commands
  use {'tpope/vim-rails', ft = "ruby" } -- only load when opening Ruby file

  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'junegunn/vim-easy-align'
  use 'pedrohdz/vim-yaml-folds'

  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-tmux-runner'


  use 'itchyny/lightline.vim'
  use 'mengelbrecht/lightline-bufferline'
  use 'ryanoasis/vim-devicons'
  use {'Mofiqul/vscode.nvim', branch = 'main' }
  use {'joshdick/onedark.vim', branch = 'main' }
end)
