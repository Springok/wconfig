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

}

vim.opt.wildignore =  'log/**,node_modules/**,target/**,tmp/**,*.rbc'

for k, v in pairs(options) do
  vim.opt[k] = v
end
