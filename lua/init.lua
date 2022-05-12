local indent, width = 2, 80

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
