-- Lua modules are found inside a lua/ folder in your 'runtimepath' (for most users, this will mean ~/.config/nvim/lua
require "config.plugins"
require "config.options"
require "config.cmp"
require "config.lsp"
require "config.telescope"
require "config.treesitter"
require "config.gitsigns"
require "config.nvim-tree"
require "config.bufferline"
require "config.lualine"
require "config.autocommands"
require "config.keymaps"
require "impatient"

vim.cmd "colorscheme onedark"

