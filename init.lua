local indent, width = 2, 80
vim.g.mapleader = ','

-- Lua modules are found inside a lua/ folder in your 'runtimepath' (for most users, this will mean ~/.config/nvim/lua
require('wc.plugins')
require('wc.options')

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
