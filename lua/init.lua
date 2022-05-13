local indent, width = 2, 80

-- Lua modules are found inside a lua/ folder in your 'runtimepath' (for most users, this will mean ~/.config/nvim/lua
require('plugins')

vim.g.mapleader = ','

vim.opt.expandtab = true   -- expand tabs to spaces
vim.opt.hidden = true      -- allow you to switch between buffers without saving
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.cursorline = false
vim.opt.hlsearch = false
vim.opt.swapfile = false  -- disable .swp files creation in vim
vim.opt.wrap = false
vim.opt.number = true      -- show line numbers
vim.opt.relativenumber = true
vim.opt.scrolloff = 3      -- show context above/below cursorline
vim.opt.shiftwidth = 2     -- normal mode indentation commands use 2 spaces
vim.opt.showcmd = true
vim.opt.smartcase  = true  -- case-sensitive search if any caps
vim.opt.softtabstop = 2    -- insert mode tab and backspace use 2 spaces
vim.opt.splitright = true
vim.opt.tabstop = 8        -- actual tabs occupy 8 characters
vim.opt.undofile = true
vim.opt.wildignore = 'log/**,node_modules/**,target/**,tmp/**,*.rbc'
vim.opt.wildmode = 'longest,list,full'

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

vim.keymap.set('n', "<leader>V", ":source ~/proj/wconfig/lua/init.lua<CR>:echo 'vimrc reloaded'<CR>")
