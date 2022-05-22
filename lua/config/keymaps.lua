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
keymap("n", "<leader>fc", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)

-- NvimTree
keymap("n", "<leader>dd", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>df", ":NvimTreeFindFile<cr>", opts)

-- in case you forgot to sudo
keymap("c", "w!!", "%!sudo tee > /dev/null %", opts)

-- indenting
keymap("n", "<leader>in", "mmgg=G'm", opts)
keymap("n", "<Leader>it", ":IndentBlanklineToggle<cr>", opts)
keymap("n", "<leader>p", "obinding.pry<ESC>^", term_opts)

-- use system clipboard
keymap("v", "<Leader>y", '"+y', opts)
keymap("n", "<Leader>P", '"+p', opts)
keymap("n", "<Leader>y", '"+y', opts)

-- window
keymap("n", "<leader>w",  "<C-w>", opts)
keymap("n", "<leader>wf", "<C-w>f<C-w>H", opts)

-- buffer switch
keymap("n", "<tab>", ":bn<CR>", opts)
keymap("n", "<S-tab>", ":bp<CR>", opts)

-- Note that remapping C-s requires flow control to be disabled (in .zshrc)
keymap("n", "<C-s>", "<esc>:w<CR>", opts)
keymap("i", "<C-s>", "<esc>:w<CR>", opts)
keymap("v", "<C-s>", "<esc>:w<CR>", opts)

-- Close current buffer
keymap("n", "<leader>q", "<esc>:bw<cr>", opts)
keymap("i", "<leader>q", "<esc>:bw<cr>", opts)

--  in all modes hit ,, can return to normal mode
keymap("n", ",,", "<C-\\><C-N>", opts)
keymap("i", ",,", "<C-\\><C-N>", opts)

-- run commands in vim
keymap("n", "<leader>ss", ":!rpu<enter>", opts)
keymap("n", "<leader>ks", ":!krpu<enter>", opts)

-- Rails
keymap("n", "<leader>aa", ":A<CR>", opts)
keymap("n", "<leader>av", ":AV<CR>", opts)
keymap("n", "<leader>gr", ":R<CR>", opts)
keymap("n", "<leader>vl", ":sp<cr><C-^><cr>", opts)
keymap("n", "<leader>hl", ":vsp<cr><C-^><cr>", opts)

keymap("n", "<leader>gb",  ":Git blame<cr>", opts)
keymap("n", "<leader>ge",  ":Gedit<Space>", opts)
keymap("n", "<leader>gdw", ":Gdiff<cr>", opts)
keymap("n", "<leader>gdi", ":Gdiff HEAD<cr>", opts)
keymap("n", "<leader>gs",  ":Git<cr>", opts)
-- nmap <leader>gdd :Gdiff<Space>
-- " compare with working area
-- " compare with index
-- " reset the diff with working area in Gdiff mode
-- " nmap <leader>gdr :diffget<cr>

keymap("n", "<leader><space>",  ":call abagile#whitespace#strip_trailing()<cr>", opts)

keymap("n", "<Leader>tl", ":call abagile#rails#test_tmux('h')", opts)
keymap("n", "<Leader>tf", ":call abagile#rails#test_tmux('h', 1)", opts)

keymap("n", "<Leader>]", ":SymbolsOutline<cr>", opts)
