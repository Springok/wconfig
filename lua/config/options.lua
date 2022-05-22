local options = {
  expandtab = true,   -- expand tabs to spaces
  hidden = true,      -- allow you to switch between buffers without saving
  ignorecase = true,  -- case-insensitive search
  cursorline = false,
  hlsearch = false,
  swapfile = false,   -- disable .swp files creation in vim vim.opt.wrap = false
  number = true,      -- show line numbers
  relativenumber = true,
  scrolloff = 3,      -- show context above/below cursorline
  shiftwidth = 2,     -- normal mode indentation commands use 2 spaces
  showcmd = true,
  smartcase  = true,  -- case-sensitive search if any caps
  softtabstop = 2,    -- insert mode tab and backspace use 2 spaces
  splitright = true,
  tabstop = 8,        -- actual tabs occupy 8 characters
  undofile = true,
  smartindent = true, -- Insert indents automatically
  wildmode = 'longest,list,full',
  termguicolors = true,
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  updatetime=250,
  -- foldmethod="expr",
  -- foldexpr="nvim_treesitter#foldexpr()",
}

vim.opt.wildignore =  'log/**,node_modules/**,target/**,tmp/**,*.rbc'
vim.opt.list = true

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- default ignore comment and string in vim-easy-align
vim.g.easy_align_ignore_groups = {}
vim.g.tmux_navigator_disable_when_zoomed = 1
vim.g.abagile_migrant_structure_fold = 1

vim.g.sexp_enable_insert_mode_mappings = 0

-- tokyo night, https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors.lua

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#292e42 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#24283b gui=nocombine]]

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
  char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
}

-- vim.g.do_filetype_lua = 1
-- vim.filetype.add({
--   filename = {
--     ['*.thor'] = 'ruby',
--   },
-- })
