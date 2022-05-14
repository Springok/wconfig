local indent, width = 2, 80
-- Lua modules are found inside a lua/ folder in your 'runtimepath' (for most users, this will mean ~/.config/nvim/lua
require "wc.plugins"
require "wc.options"
require "wc.cmp"
require "wc.lsp"
require "wc.telescope"

vim.cmd "colorscheme onedark"

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap leader key
vim.g.mapleader = ','
-- vim.g.maplocalleader = " "

-- Modes
--   normlal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--  discard direction keys
keymap("n", "<up>", "<nop>", opts)
keymap("n", "<down>", "<nop>", opts)
keymap("n", "<left>", "<nop>", opts)
keymap("n", "<right>", "<nop>", opts)

keymap("i", "<up>", "<nop>", opts)
keymap("i", "<down>", "<nop>", opts)
keymap("i", "<left>", "<nop>", opts)
keymap("i", "<right>", "<nop>", opts)

-- sometimes need, to repeat latest f, t, F or T in opposite direction
keymap("", "\\", ",", opts)

-- " Helps when I want to delete something without clobbering my unnamed register.
keymap("n", "s", '"_d', opts)
keymap("n", "ss", '"_dd', opts)

-- " navigating
keymap("n", "H", '^', opts)
keymap("n", "L", '$', opts)
keymap("n", "j", 'gj', term_opts)
keymap("n", "k", 'gk', term_opts)
keymap("n", ",gv", 'V`', opts)

-- " Keeping it centered
keymap("n", "n", 'nzzzv', opts)
keymap("n", "N", 'Nzzzv', opts)
keymap("n", "J", 'mzJ`z', opts)

keymap("n", "<C-n>", "<C-i>", opts)

keymap("n", "Y", "yg_", opts)

-- " moving text
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
-- " Don't copy the contents of an overwritten selection.
keymap("v", "p", '"_dP', opts)

--  Vim Tmux Navigator
vim.g['tmux_navigator_disable_when_zoomed'] = 1

-- " Vim Tmux Runner
vim.keymap.set('n', '<leader>ar', ":VtrAttachToPane<CR>")
vim.keymap.set('n', '<leader>kr', ":VtrKillRunner<CR>")
vim.keymap.set('n', '<leader>sl', ":VtrSendLinesToRunner<CR>")
vim.keymap.set('n', '<leader>rt', ":VtrOpenRunner {'orientation': 'v', 'percentage': 15, 'cmd': 'rtw'}<CR>")

-- start interactive EasyAlign in visual mode
vim.keymap.set('v', "<Enter>", "<Plug>(EasyAlign)")
--  start interactive EasyAlign for a motion/text object (e.g. <leader>eaip)
vim.keymap.set('n', "<leader>l", "<Plug>(EasyAlign)")

vim.keymap.set('n', "<leader>V", ":source ~/proj/wconfig/init.lua<CR>:echo 'vimrc reloaded'<CR>")

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fl", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
