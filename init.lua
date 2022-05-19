-- Lua modules are found inside a lua/ folder in your 'runtimepath' (for most users, this will mean ~/.config/nvim/lua
local ok, impatient = pcall(require, 'impatient')
if ok then
  impatient.enable_profile()
else
  vim.notify(impatient)
end

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
require "config.conjure"
require "config.autocommands"
require "config.keymaps"
require "config.null-ls"

-- vim.cmd[[colorscheme onedark]]
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme material]]
