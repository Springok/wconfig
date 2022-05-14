-- Lua modules are found inside a lua/ folder in your 'runtimepath' (for most users, this will mean ~/.config/nvim/lua
require "wc.plugins"
require "wc.options"
require "wc.cmp"
require "wc.lsp"
require "wc.telescope"
require "wc.treesitter"
require "wc.gitsigns"
require "wc.nvim-tree"
require "wc.bufferline"
require "wc.lualine"
require "wc.autocommands"
require "wc.keymaps"

vim.cmd "colorscheme onedark"

