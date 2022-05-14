return require('packer').startup(function()
   -- Packer can manage itself
  use 'wbthomason/packer.nvim'

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
