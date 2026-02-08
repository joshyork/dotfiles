-- Key mappings

local map = vim.keymap.set

-- Clear search highlight on Escape
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic navigation
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
map('n', '<leader>xd', vim.diagnostic.open_float, { desc = 'Show diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })

-- Window navigation handled by vim-tmux-navigator plugin

-- Better up/down with wrapped lines
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move lines up/down in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Keep cursor centered when scrolling
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Keep cursor centered when searching
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Buffer navigation
map('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })

-- Better paste (don't overwrite register)
map('x', '<leader>p', '"_dP', { desc = 'Paste without overwriting register' })

-- Reveal current file in neo-tree (then r to rename, etc)
map('n', '<leader>er', '<cmd>Neotree reveal<CR>', { desc = 'Reveal file in explorer' })

-- Focus neo-tree without changing its state
map('n', '<leader>ef', '<cmd>Neotree focus<CR>', { desc = 'Focus explorer' })

-- Toggle line numbers
map('n', '<leader>ul', function()
  vim.opt.number = not vim.opt.number:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = 'Toggle line numbers' })

map('n', '<leader>ua', function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = 'Toggle relative/absolute numbers' })

-- Resize windows (repeatable with held key)
map('n', '<c-Up>', '<cmd>resize +2<CR>', { desc = 'Increase height' })
map('n', '<c-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease height' })
map('n', '<c-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase width' })
map('n', '<c-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease width' })

-- Toggle zoom current window
map('n', '<leader>z', function()
  if vim.g.zoomed_winrestcmd then
    vim.cmd(vim.g.zoomed_winrestcmd)
    vim.g.zoomed_winrestcmd = nil
  else
    vim.g.zoomed_winrestcmd = vim.fn.winrestcmd()
    vim.cmd('wincmd |')
    vim.cmd('wincmd _')
  end
end, { desc = 'Toggle zoom window' })
