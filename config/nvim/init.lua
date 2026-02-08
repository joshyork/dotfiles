-- init.lua — Entry point for neovim config
-- Based on kickstart.nvim, modularized into lua/plugins/

-- Set leader key before anything else
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load core config
require('options')
require('keymaps')
require('autocmds')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from lua/plugins/
require('lazy').setup('plugins', {
  change_detection = { notify = false },
})
