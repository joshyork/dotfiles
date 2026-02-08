-- Core vim options

-- Disable netrw (neo-tree replaces it)
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.scrolloff = 10

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Files
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.autoread = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Clipboard
opt.clipboard = 'unnamedplus'

-- Completion
opt.completeopt = 'menu,menuone,noselect'

-- Whitespace display
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitution preview
opt.inccommand = 'split'

-- Minimum window width for number column
opt.numberwidth = 4

-- Mouse
opt.mouse = 'a'

-- Don't show mode (statusline handles it)
opt.showmode = false

-- Break indent
opt.breakindent = true

-- Diagnostic floats: border + padding
vim.diagnostic.config({
  float = {
    border = 'rounded',
    prefix = ' ',
    suffix = ' ',
    header = '',
    source = true,
  },
})
